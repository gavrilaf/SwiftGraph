//
//  ExaminationTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/19/17.
//
//

import XCTest
import SwiftGraph

class ExaminationTests: XCTestCase {
    
    func testCheckIsDAG() {
        let grEmpty = ConstEdgeGraph<Int>(vertices: [], edges: [])
        XCTAssertTrue(grEmpty.isDAG())
        
        let grOne = ConstEdgeGraph<Int>(vertices: [1], edges: [])
        XCTAssertTrue(grOne.isDAG())
        
        let grTwo = ConstEdgeGraph<Int>(vertices: [1, 2], edges: [(1, 2)])
        XCTAssertTrue(grTwo.isDAG())
        
        let grCycle = ConstEdgeGraph<Int>(vertices: [1, 2, 3], edges: [(1, 2), (2, 3), (3, 1)])
        XCTAssertFalse(grCycle.isDAG())
        
        
        let gr = ConstEdgeGraph<Int>(vertices: [1, 2, 3, 4, 5, 6, 7, 8, 9], edges: [(8, 9), (1, 4), (1, 2), (4, 2),
                                                                                    (4, 3), (3, 2), (5, 2), (3, 5), (8, 2), (8, 6)])
        
        XCTAssertTrue(gr.isDAG())
    }
    
    
    
}
