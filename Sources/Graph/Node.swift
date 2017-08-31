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

public struct AdjacentIterator<V: VertexProtocol, E: EdgeProtocol>: IteratorProtocol {
    var it: IndexingIterator<Array<Edge<V, E>>>
    
    init(_ edges: [Edge<V, E>]) { it = edges.makeIterator() }
    
    public mutating func next() -> V? {
        return it.next()?.end.vertex
    }
}

public struct AdjacentSequence<V: VertexProtocol, E: EdgeProtocol>: Sequence {
    let edges: [Edge<V, E>]
    
    public func makeIterator() -> AdjacentIterator<V, E> {
        return AdjacentIterator(edges)
    }
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
        return AdjacentSequence(edges: edges)
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

