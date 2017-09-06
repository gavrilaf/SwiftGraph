//
//  OrderCheckerTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import XCTest
import SwiftGraph

class OrderCheckerTests: XCTestCase {

    func testStreamOrderChecker() {
        let ordered = [1, 23, 45, 78, 98]
        let unordered = [45, 1, 23, 45, 78, 98]
        
        XCTAssertTrue(isOrdered(sequence: ordered, cmp: { $0 < $1 } ))
        XCTAssertFalse(isOrdered(sequence: unordered, cmp: { $0 < $1 } ))
    }
}
