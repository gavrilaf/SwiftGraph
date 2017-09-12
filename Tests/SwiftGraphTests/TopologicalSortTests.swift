//
//  TopologicalSortTests.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/3/17.
//
//

import XCTest
import SwiftGraph

func toString<V: CustomStringConvertible>(_ arr: [V]) -> String {
    return arr.reduce("", { (s, n) -> String in return s.isEmpty ? String(describing: n) : s + " " + String(describing: n) })
}

func toStrSet<V: CustomStringConvertible>(_ arr: [[V]]) -> Set<String> {
    return Set(arr.map { (a) -> String in return toString(a) })
}

// TODO: Finish tests!
class TopologicalSortTests: XCTestCase {
    
    func testTopologicalAllSolutionsCornerCases() {
        let grEmpty = ConstEdgeGraph<Int>(vertices: [], edges: [])
        XCTAssertTrue(topologicalSortFindAll(graph: grEmpty).isEmpty)
        
        let grOne = ConstEdgeGraph<Int>(vertices: [1], edges: [])
        XCTAssertEqual(toStrSet(topologicalSortFindAll(graph: grOne)), Set(["1"]))
        
        let grTwo = ConstEdgeGraph<Int>(vertices: [1, 2], edges: [])
        XCTAssertEqual(toStrSet(topologicalSortFindAll(graph: grTwo)), Set(["1 2", "2 1"]))
        
        let grTwoCn = ConstEdgeGraph<Int>(vertices: [1, 2], edges: [(1, 2)])
        XCTAssertEqual(toStrSet(topologicalSortFindAll(graph: grTwoCn)), Set(["1 2"]))
        
        let grCycle = ConstEdgeGraph<Int>(vertices: [1, 2, 3], edges: [(1, 2), (2, 3), (3, 1)])
        XCTAssertTrue(topologicalSortFindAll(graph: grCycle).isEmpty)
    }
    
    func testTopologicalAllSolutions() {
        let gr = ConstEdgeGraph<Int>(vertices: [0, 1, 2, 3, 4, 5],
                                     edges: [(5, 2), (5, 0), (4, 0), (4, 1), (2, 3), (3, 1)])
        
        let allPaths = Set(["4 5 0 2 3 1", "4 5 2 0 3 1", "4 5 2 3 0 1", "4 5 2 3 1 0", "5 2 3 4 0 1", "5 2 3 4 1 0" , "5 2 4 0 3 1", "5 2 4 3 0 1",
                            "5 2 4 3 1 0", "5 4 0 2 3 1", "5 4 2 0 3 1", "5 4 2 3 0 1", "5 4 2 3 1 0"])
        
        let sset = toStrSet(topologicalSortFindAll(graph: gr))
        XCTAssertEqual(allPaths, sset)
    }
    
    func testTopologicalSort1() {
        let gr = ConstEdgeGraph<Int>(vertices: [0, 1, 2, 3, 4, 5], edges: [(5, 2), (5, 0), (4, 0), (4, 1), (2, 3), (3, 1)])
        
        let all = toStrSet(topologicalSortFindAll(graph: gr))
        let solution = toString(topologicalSort(graph: gr))
        
        XCTAssertTrue(all.contains(solution))
    }
    
    func testTopologicalSort2() {
        let gr = ConstEdgeGraph<Int>(vertices: [1, 2, 3, 4, 5, 6, 7, 8, 9], edges: [(8, 9), (1, 4), (1, 2), (4, 2),
                                                                                    (4, 3), (3, 2), (5, 2), (3, 5), (8, 2), (8, 6)])
        
        let all = toStrSet(topologicalSortFindAll(graph: gr))
        let solution = toString(topologicalSort(graph: gr))
        
        XCTAssertTrue(all.contains(solution))
    }
    
    func testTopologicalSort3() {
        let gr = ConstEdgeGraph<String>(vertices: ["A", "B", "C", "D", "E", "F"], edges: [("A", "B"), ("A", "C"), ("A", "D"), ("B", "E"),
                                                                                          ("B", "F"), ("C", "F")])
        
        let all = toStrSet(topologicalSortFindAll(graph: gr))
        let solution = toString(topologicalSort(graph: gr))
        
        XCTAssertTrue(all.contains(solution))
    }
    
    func testTopologicalSortCornerCases() {
        let grEmpty = ConstEdgeGraph<Int>(vertices: [], edges: [])
        XCTAssertTrue(topologicalSort(graph: grEmpty).isEmpty)
        
        let grOne = ConstEdgeGraph<Int>(vertices: [1], edges: [])
        XCTAssertEqual(toString(topologicalSort(graph: grOne)), "1")
        
        let grTwo = ConstEdgeGraph<Int>(vertices: [1, 2], edges: [(1, 2)])
        XCTAssertEqual(toString(topologicalSort(graph: grTwo)), "1 2")
        
        let grCycle = ConstEdgeGraph<Int>(vertices: [1, 2, 3], edges: [(1, 2), (2, 3), (3, 1)])
        XCTAssertTrue(topologicalSort(graph: grCycle).isEmpty)
    }
    
    
}
