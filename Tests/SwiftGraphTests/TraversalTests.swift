import XCTest
import SwiftGraph

// Samples from:
// https://www.codeproject.com/Articles/32212/Introduction-to-Graph-with-Breadth-First-Search-BF
// http://www.techiedelight.com/breadth-first-search/
// http://www.techiedelight.com/depth-first-search/

class TraversalTests: XCTestCase {
    
    let graph: ConstEdgeGraph<String> = {
        let gr = ConstEdgeGraph<String>(vertices: ["A", "B", "C", "D", "E", "F"],
                                        edges: [("A", "B"), ("A", "C"), ("A", "D"), ("B", "E"), ("B", "F"), ("C", "F")])
        return gr
    }()
    
    let graph2: ConstEdgeGraph<Int> = {
        let gr = ConstEdgeGraph<Int>(vertices: [1,2,3,4,5,6,7,8,9,10,11,12,13,14])
        gr.add(edges: [(1, 2), (1, 3), (1, 4), (2, 5), (2, 6), (5, 9), (5, 10), (4, 7), (4, 8), (7, 11), (7, 12)]) // vertex 13 and 14 are single nodes
        
        return gr
    }()
    
    let graph3: ConstEdgeGraph<Int> = {
        let gr = ConstEdgeGraph<Int>()
        
        gr.add(vertices: [1,2,3,4,5,6,7,8,9,10,11,12,13,14])
        gr.add(edges: [(1, 2), (1, 7), (1, 8), (2, 3), (2, 6), (3, 4), (3, 5), (8, 9), (8, 12), (9, 10), (9, 11)]) // vertex 13 and 14 are single nodes
        
        return gr
    }()
    
    
    
    func testBFS() {
        let path = graph.bfs(start: "A").reduce("") { return $0 + $1 }
        //print("BSF path = \(path)")
        XCTAssertEqual(path, "ABCDEF")
        
        let path2 = graph2.bfs(start: 1).map { return $0 }
        //print("BSF path2 = \(path2)")
        XCTAssertEqual(path2, [1,2,3,4,5,6,7,8,9,10,11,12])
    }
    
    func testDFS() {
        let path = graph.dfs(start: "A").reduce("") { return $0 + $1 }
        //print("DSF path = \(path)")
        XCTAssertEqual(path, "ABEFCD")
        
        let path2 = graph3.dfs(start: 1).map { return $0 }
        //print("DSF path2 = \(path2)")
        XCTAssertEqual(path2, [1,2,3,4,5,6,7,8,9,10,11,12])
    }
        
        


    static var allTests = [
        ("testBFS", testBFS),
        ("testDFS", testDFS),
    ]
}
