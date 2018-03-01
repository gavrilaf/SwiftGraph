//
//  PriorityQueueTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 3/30/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
import SwiftGraph

class BinaryHeapTests: XCTestCase {
    
    func testBinaryHeap() {
        let pq = BinaryHeap<Int>(sort: { return $0 < $1 })
        
        pq.push(2)
        pq.push(1)
        pq.push(4)
        pq.push(5)
        pq.push(3)
        
        
        XCTAssertEqual(pq.top, 5)
        
        _ = pq.pop()
        _ = pq.pop()
        
        XCTAssertEqual(pq.top, 3)
        XCTAssertEqual(pq.size, 3)
        XCTAssertEqual(pq.isEmpty, false)
        
        pq.push(1093)
        pq.push(112)
        
        XCTAssertEqual(pq.pop(), 1093)
        XCTAssertEqual(pq.top, 112)
        
        _ = pq.pop()
        _ = pq.pop()
        _ = pq.pop()
        XCTAssertEqual(pq.pop(), 1)
        
        XCTAssertNil(pq.pop())
        XCTAssertNil(pq.top)
        
        XCTAssertEqual(pq.size, 0)
        XCTAssertEqual(pq.isEmpty, true)
        
        pq.push(1000)
        XCTAssertEqual(pq.top, 1000)
        XCTAssertEqual(pq.pop(), 1000)
        XCTAssertEqual(pq.pop(), nil)
    }

    func testBinaryHeapOnRandom() {
        let pq = BinaryHeap<UInt32>(sort: { return $0 < $1 }) // Create min-heap
        
        for _ in 0..<100 {
            for _ in 0..<5 {
                pq.push(arc4random_uniform(1000))
            }
            _ = pq.pop()
        }
        
        var checker = StreamOrderChecker<UInt32>(cmp: { return $0 >= $1 })
        while let t = pq.pop() {
            _ = checker.checkNext(t)
        }
        
        XCTAssertTrue(checker.isOrdered)
    }
    
    func testBuildBinaryHeap() {
        let a = [1, 90, 3, 45, 23, 8, 234, 589, 234, 12, 34, 90, 11, 11, 11, 23, 56]
        
        let pq = BinaryHeap(array: a, sort: { return $0 < $1 }) // Create min-heap
        
        var checker = StreamOrderChecker<Int>(cmp: { return $0 >= $1 })
        while let t = pq.pop() {
            _ = checker.checkNext(t)
        }
        
        XCTAssertTrue(checker.isOrdered)
    }
    
    func testStringdBinaryHeap() {
        let a = ["aa", "aaa", "b", "cccccc", "abc", "z", "xyx", "mb"]
        
        let pq = BinaryHeap(array: a, sort: { return $0 < $1 })
        
        for s in a {
            pq.push(s)
        }
        
        XCTAssertEqual(pq.size, 2 * a.count)
        
        var checker = StreamOrderChecker<String>(cmp: { return $0 >= $1 })
        while let t = pq.pop() {
            _ = checker.checkNext(t)
        }
        
        XCTAssertTrue(checker.isOrdered)
    }
    
    /*func testBinaryHeapPerformance() {
        let ar = Random.intArray(size: 100000)
        let pq = BinaryHeap<Int>(sort: { return $0 < $1 })
        
        self.measure {
            for v in ar {
                for _ in 0..<5 {
                    pq.push(v)
                }
                _ = pq.pop()
            }
            
            while !pq.isEmpty {
                _ = pq.pop()
            }
        }
    }
    
    func testBuildBinaryHeapPerformance() {
        let ar = Random.intArray(size: 1000000)
        
        self.measure {
            let pq = BinaryHeap<Int>(array: ar, sort: { return $0 < $1 })
            _ = pq.pop()
        }
    }*/
}
