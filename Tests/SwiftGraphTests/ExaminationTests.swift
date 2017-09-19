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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCheckIsDAG() {
        let gr = ConstEdgeGraph<Int>(vertices: [1, 2, 3, 4, 5, 6, 7, 8, 9], edges: [(8, 9), (1, 4), (1, 2), (4, 2),
                                                                                    (4, 3), (3, 2), (5, 2), (3, 5), (8, 2), (8, 6)])
        
        XCTAssertTrue(isDAG(graph: gr))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
