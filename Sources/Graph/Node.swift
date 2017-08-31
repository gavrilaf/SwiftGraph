//
//  Node.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/20/17.
//
//

import Foundation

public protocol VertexProtocol: Hashable, Equatable {
    var id: String { get }
}

public protocol EdgeProtocol {
    var weight: Int { get }
}

// MARK:

public struct AdjacentSequence<V: VertexProtocol, E: EdgeProtocol>: Sequence, IteratorProtocol {
    public mutating func next() -> V? {
        return it.next()?.end.vertex
    }
    
    // 
    init(_ edges: [Edge<V, E>]) { it = edges.makeIterator() }
    
    var it: IndexingIterator<Array<Edge<V, E>>>
}

public class Node<V: VertexProtocol, E: EdgeProtocol>: Hashable, Equatable {
    
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
    public var adjacent: AdjacentSequence<V, E> {
        return AdjacentSequence(edges)
    }
    
    // MARK:
    func addAdj(node: Node<V, E>, edge: E) {
        edges.append(Edge(edge: edge, end: node))
    }
    
    // MARK:
    
    let vertex: V
    var edges = [Edge<V, E>]()
}

struct Edge<V: VertexProtocol, E: EdgeProtocol> {
    var edge: E
    var end: Node<V, E>
}


// MARK:

extension Int: VertexProtocol {
    public var id: String { return String(self) }
}

extension String: VertexProtocol {
    public var id: String { return self }
}

extension Int: EdgeProtocol {
    public var weight: Int { return self }
}

