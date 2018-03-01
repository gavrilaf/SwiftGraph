//
//  DFS.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/22/17.
//
//

import Foundation

public class DFS<V: VertexProtocol, E: EdgeProtocol> : Sequence, IteratorProtocol {
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        
        if let node = graph.nodes[start.hashValue] {
            stack.push(node)
        }
    }
    
    public func next() -> V? {
        while let current = stack.pop() {
            if visited.contains(current.vertex) {
                continue
            }
            
            current.edges.reversed().forEach { (edge) in
                if !self.visited.contains(edge.end.vertex) {
                    stack.push(edge.end)
                }
            }
            
            visited.insert(current.vertex)
            return current.vertex
        }
        
        return nil
    }
    
    let graph: Graph<V, E>
    
    var visited = Set<V>()
    var stack = Stack<Node<V, E>>()
}
