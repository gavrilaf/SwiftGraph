//
//  Node.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/20/17.
//
//

import Foundation

// MARK:

public class Node<V: VertexProtocol, E: EdgeProtocol>: Hashable, Equatable {
    
    // MARK:
    public struct AdjacentSequence: Sequence, IteratorProtocol {
        public mutating func next() -> Node<V, E>? {
            return it.next()?.end
        }
        
        init(_ edges: [Edge]) { it = edges.makeIterator() }
        var it: IndexingIterator<Array<Edge>>
    }

    // MARK:
    public init(vertex: V) {
        self.vertex = vertex
    }
    
    // MARK:
    public var hashValue: Int {
        return vertex.hashValue
    }
    
    public static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.vertex == rhs.vertex
    }

    // MARK:
    public var adjacent: Node<V, E>.AdjacentSequence {
        return AdjacentSequence(edges)
    }
    
    // MARK:
    func addAdj(node: Node<V, E>, edge: E) {
        edges.append(Edge(edge: edge, end: node))
    }
    
    // MARK:
    struct Edge {
        var edge: E
        var end: Node
    }
    
    // MARK:
    let vertex: V
    var edges = [Edge]()
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "Node(vertex: \(vertex))"
    }
}



