//
//  DequeueList.swift
//  Reviro
//
//  Created by Eugen Fedchenko on 4/17/17.
//
//

import Foundation

public struct Dequeue<E> {
    
    public init() {
        nilNode = Node<E>()
        nilNode.next = nilNode
        nilNode.prev = nilNode
    }
    
    
    class Node<E> {
        var value: E?
        var next: Node?
        weak var prev: Node?
        
        init() {
            value = nil
        }
        
        init(value: E) {
            self.value = value
        }
    }
    
    let nilNode: Node<E>
}

extension Dequeue {
    
    public var isEmpty: Bool {
        return first == nil
    }
    
    public var first: E? {
        return nilNode.next?.value
    }
    
    public var last: E? {
        return nilNode.prev?.value
    }
    
    public func pushFirst(_ e: E) {
        let node = Node(value: e)
        
        node.next = nilNode.next
        node.prev = nilNode
        
        nilNode.next?.prev = node
        nilNode.next = node
    }
    
    public func pushLast(_ e: E) {
        let node = Node(value: e)
        
        node.prev = nilNode.prev
        node.next = nilNode
        
        nilNode.prev?.next = node
        nilNode.prev = node
    }
    
    @discardableResult
    public func popFirst() -> E? {
        let value = nilNode.next?.value
        nilNode.next = nilNode.next?.next
        nilNode.next?.prev = nilNode
        return value
    }
    
    @discardableResult
    public func popLast() -> E? {
        let value = nilNode.prev?.value
        nilNode.prev = nilNode.prev?.prev
        nilNode.prev?.next = nilNode
        return value
    }
    
    public func clear() {
        nilNode.next = nilNode
        nilNode.prev = nilNode
    }
}

extension Dequeue: CustomStringConvertible {
    public var description: String {
        var s = "Dequeue["
        
        var p = nilNode.next
        var first = true
        while let v = p?.value {
            if first {
                first = false
            } else {
                s += ", "
            }
            s += String(describing: v)
            
            p = p?.next
        }
        
        s += "]"
        return s
    }
}
