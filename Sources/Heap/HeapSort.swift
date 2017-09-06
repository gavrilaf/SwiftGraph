//
//  HeapSort.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 4/2/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

public struct HeapSort {
    
    public static func sort<E>(array: inout [E], cmp: @escaping (E, E) -> Bool) {
        array.withUnsafeMutableBufferPointer { (buffer) in
            buildHeap(buffer: &buffer, cmp: cmp)
            for i in stride(from: buffer.count - 1, through: 1, by: -1) {
                swap(&buffer[0], &buffer[i])
                shiftDown(buffer: &buffer, index: 0, heapSize: i, cmp: cmp)
            }
        }
    }
    
    // MARK: Heapsort helpers
    
    @inline(__always) static func parentIndex(of indx: Int) -> Int {
        return (indx - 1) / 2
    }
    
    @inline(__always) static func leftIndex(of indx: Int) -> Int {
        return 2*indx + 1
    }
    
    @inline(__always) static func rightIndex(of indx: Int) -> Int {
        return 2*indx + 2
    }

    static func buildHeap<E>(buffer: inout UnsafeMutableBufferPointer<E>, cmp: (E, E) -> Bool) {
        guard buffer.count > 0 else { return }
        
        for i in stride(from: (buffer.count/2 - 1), through: 0, by: -1) {
            shiftDown(buffer: &buffer, index: i, heapSize: buffer.count, cmp: cmp)
        }
    }
    
    static func shiftUp<E>(buffer: inout UnsafeMutableBufferPointer<E>, index: Int, cmp: (E, E) -> Bool) {
        var childIndx = index
        
        let child = buffer[childIndx]
        var parentIndx = HeapSort.parentIndex(of: childIndx)
        
        while childIndx > 0 && !cmp(child, buffer[parentIndx]) {
            buffer[childIndx] = buffer[parentIndx]
            childIndx = parentIndx
            parentIndx = HeapSort.parentIndex(of: childIndx)
        }
        
        buffer[childIndx] = child
    }

    static func shiftDown<E>(buffer: inout UnsafeMutableBufferPointer<E>, index: Int, heapSize: Int, cmp: (E, E) -> Bool) {
        var parentIndx = index
        
        while parentIndx < heapSize {
            let leftIndx = leftIndex(of: parentIndx)
            let rightIndx = leftIndx + 1
            var firstIndx = parentIndx
            
            if leftIndx < heapSize && cmp(buffer[firstIndx], buffer[leftIndx]) {
                firstIndx = leftIndx
            }
            
            if rightIndx < heapSize && cmp(buffer[firstIndx], buffer[rightIndx]) {
                firstIndx = rightIndx
            }
                
            if firstIndx == parentIndx { break }
                
            swap(&buffer[parentIndx], &buffer[firstIndx])
            parentIndx = firstIndx
        }
    }
}
