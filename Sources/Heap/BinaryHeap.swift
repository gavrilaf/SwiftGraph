//
//  BinaryHeap.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 3/30/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

public final class BinaryHeap<E> {

    public init(sort: @escaping (E, E) -> Bool) {
        self.isBefore = sort
        count = 0
    }
    
    public init(array: [E], sort: @escaping (E, E) -> Bool) {
        self.isBefore = sort
        buildHeap(array: array)
    }
    
    // MARK: Heap
    
     public func push(_ e: E) {
        if count < elements.count {
            elements[count] = e
        } else {
            elements.append(e)
        }
        
        count += 1
        shiftUp(count-1)
    }
    
     public func pop() -> E? {
        guard let p = top else { return nil }
        
        if count > 1 {
            elements.swapAt(0, count-1)
            count -= 1
            shiftDown(0)
        } else {
            count -= 1
        }
        
        return p
    }
    
    public var top: E? {
        return count == 0 ? nil : elements[0]
    }
    
    public var isEmpty: Bool {
        return size == 0
    }
    
    public var size: Int {
        return count
    }
    
    // MARK: Utility
    public func clear() {
        elements.removeAll()
        count = 0
    }
    
    // MARK:
    fileprivate let isBefore: (E, E) -> Bool
    fileprivate var elements = [E]()
    fileprivate var count = 0
}

// MARK: Helpers
extension BinaryHeap {
    
    func shiftUp(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftUp(buffer: &buf, index: indx, cmp: isBefore)
        }
    }
    
    func shiftDown(_ indx: Int) {
        elements.withUnsafeMutableBufferPointer { buf in
            HeapSort.shiftDown(buffer: &buf, index: indx, heapSize: count, cmp: isBefore)
        }
    }
    
    func buildHeap(array: [E]) {
        guard array.count > 1 else { return }
        
        elements = array
        elements.withUnsafeMutableBufferPointer { (buf) in
            HeapSort.buildHeap(buffer: &buf, cmp: isBefore)
        }
        
        count = elements.count
    }
}
