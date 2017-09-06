//
//  StreamOrderChecker.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

// MARK:
public struct StreamOrderChecker<T> {
    
    public init(cmp: @escaping (T, T) -> Bool) {
        self.cmp = cmp
    }
    
    public mutating func reset() {
        curr = nil
        result = true
    }
    
    public mutating func checkNext(_ t: T) -> Bool {
        if let curr = curr {
            result = result && cmp(curr, t)
            return result
        }
        
        
        curr = t
        return true
    }
    
    public var isOrdered: Bool {
        return result
    }
    
    fileprivate let cmp: (T, T) -> Bool
    fileprivate var result = true
    fileprivate var curr: T?
}

// MARK:
public func isOrdered<E: Sequence, T>(sequence: E, cmp: @escaping (T, T) -> Bool) -> Bool where E.Iterator.Element == T {
    var checker = StreamOrderChecker(cmp: cmp)
    for e in sequence {
        if !checker.checkNext(e) { return false }
    }
    return checker.isOrdered
}
