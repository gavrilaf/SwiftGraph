//
//  HeapSortTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 4/2/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
import SwiftGraph

class HeapSortTests: XCTestCase {

    func testArrayHeapSort() {
        var a = [100, 3, 5, 45, 90, 23, 223, 8791, 334]
        
        HeapSort.sort(array: &a, cmp: { $0 < $1 })
        XCTAssertTrue(isOrdered(sequence: a, cmp: { $0 < $1 }))
        
        HeapSort.sort(array: &a, cmp: { $0 > $1 })
        XCTAssertTrue(isOrdered(sequence: a, cmp: { $0 > $1 }))
        
        var one = [1]
        HeapSort.sort(array: &one, cmp: { $0 > $1 })
        XCTAssertEqual(one.count,  1)
        XCTAssertEqual(one[0],  1)
        
        var two = [2, 1]
        HeapSort.sort(array: &two, cmp: { $0 > $1 })
        XCTAssertTrue(isOrdered(sequence: a, cmp: { $0 > $1 }))
        
        
        var empty = [String]()
        HeapSort.sort(array: &empty, cmp: { $0 > $1 })
        XCTAssertEqual(empty.count,  0)
    }
    
    func testRandomArrayHeapSort() {
        var a = Random.intArray(size: 100)
        
        HeapSort.sort(array: &a, cmp: { $0 < $1 })
        XCTAssertTrue(isOrdered(sequence: a, cmp: { $0 <= $1 }))
    }
    
    
    func testStringArrayHeapSort() {
        var a = ["aa", "xx", "z", "v", "vkrfkrpkfrfkr", "mama"]
        
        HeapSort.sort(array: &a, cmp: { $0 > $1 })
        XCTAssertTrue(isOrdered(sequence: a, cmp: { $0 >= $1 }))
    }
}
