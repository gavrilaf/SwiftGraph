//
//  Queue.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/21/17.
//
//

import Foundation

public struct Queue<T> {
    
    public init() {}
    
    public func enqueue(_ t: T) {
        deq.pushLast(t)
    }
    
    public func dequeue() -> T? {
        return deq.popFirst()
    }
    
    public var isEmpty: Bool {
        return deq.isEmpty
    }
    
    let deq = Dequeue<T>()
}
