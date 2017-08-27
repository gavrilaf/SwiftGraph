//
//  Stack.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/23/17.
//
//

import Foundation

public struct Stack<T> {
    
    public init() {}
    
    public func push(_ t: T) {
        deq.pushFirst(t)
    }
    
    public func pop() -> T? {
        return deq.popFirst()
    }
    
    public var isEmpty: Bool {
        return deq.isEmpty
    }
    
    let deq = Dequeue<T>()
}
