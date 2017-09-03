//
//  TopologicalSortTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/3/17.
//
//

import XCTest
import SwiftGraph

class TopologicalSortTests: XCTestCase {
    
    let gr1: ConstEdgeGraph<String> = {
        let gr = ConstEdgeGraph<String>(vertices: ["A", "B", "C", "D", "E", "F"],
                                        edges: [("A", "B"), ("A", "C"), ("A", "D"), ("B", "E"), ("B", "F"), ("C", "F")])
        return gr
    }()
    
    func testTopologicalSort() {
        let sorted = topologicalSort(graph: gr1)
        print(sorted)
    }
}
