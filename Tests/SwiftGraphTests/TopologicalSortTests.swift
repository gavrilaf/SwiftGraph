//
//  TopologicalSortTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/3/17.
//
//

import XCTest
import SwiftGraph

// TODO: Finish tests!
class TopologicalSortTests: XCTestCase {
    
    let gr1: ConstEdgeGraph<String> = {
        let gr = ConstEdgeGraph<String>(vertices: ["A", "B", "C", "D", "E", "F"],
                                        edges: [("A", "B"), ("A", "C"), ("A", "D"), ("B", "E"), ("B", "F"), ("C", "F")])
        return gr
    }()
    
    func testTopologicalSort1() {
        let gr: ConstEdgeGraph<Int> = {
            return ConstEdgeGraph<Int>(vertices: [0, 1, 2, 3, 4, 5],
                                       edges: [(5, 2), (5, 0), (4, 0), (4, 1), (2, 3), (3, 1)])
        }()
        
        
        let sorted = topologicalSort(graph: gr)
        print(sorted)
    }
    
    func testTopologicalSort2() {
        let gr: ConstEdgeGraph<Int> = {
            return ConstEdgeGraph<Int>(vertices: [1, 2, 3, 4, 5, 6, 7, 8, 9],
                                       edges: [(8, 9), (1, 4), (1, 2), (4, 2), (4, 3), (3, 2), (5, 2),
                                               (3, 5), (8, 2), (8, 6)])
        }()
        
        
        let sorted = topologicalSort(graph: gr)
        print(sorted)
    }
    
    func testTopologicalSort3() {
        let sorted = topologicalSort(graph: gr1)
        print(sorted)
    }
}
