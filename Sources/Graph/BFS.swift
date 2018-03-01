//
//  BFS.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/21/17.
//
//

import Foundation

public class BFS<V: VertexProtocol, E: EdgeProtocol> : Sequence, IteratorProtocol {
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        
        if let node = graph.nodes[start.hashValue] {
            visited.insert(start)
            queue.enqueue(node)
        }
    }
    
    public func next() -> V? {
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
    var queue = Queue<Node<V, E>>()
}
