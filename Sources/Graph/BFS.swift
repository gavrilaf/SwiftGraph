//
//  BFS.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/21/17.
//
//

import Foundation

public struct BFSIterator<V: VertexProtocol, E: EdgeProtocol> : IteratorProtocol {
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        
        if let node = graph.nodes[start.hashValue] {
            visited.insert(start)
            queue.enqueue(node)
        }
    }
    
    public mutating func next() -> V? {
        guard let current = queue.dequeue() else { return nil }
        
        current.edges.forEach { (edge) in
            if !self.visited.contains(edge.end.vertex) {
                visited.insert(edge.end.vertex)
                queue.enqueue(edge.end)
            }
        }
        
        return current.vertex
    }
    
    let graph: Graph<V, E>
    
    var visited = Set<V>()
    var queue = Queue<Graph<V, E>.Node>()
}

public struct BFS<V: VertexProtocol, E: EdgeProtocol> : Sequence {
    
    private let graph: Graph<V, E>
    private let start: V
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        self.start = start
    }
    
    public func makeIterator() -> BFSIterator<V, E> {
        return BFSIterator(graph: graph, start: start)
    }
}
