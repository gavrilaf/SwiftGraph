//
//  GraphBase.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/20/17.
//
//

import Foundation

open class Graph<V: VertexProtocol, E: EdgeProtocol> {
    
    public init() {}
    
    public init<S>(vertices: S) where S : Sequence, S.Iterator.Element == V {
        add(vertices: vertices)
    }
    
    open func add<S>(vertices: S) where S : Sequence, S.Iterator.Element == V {
        vertices.forEach {
            let node = Node<V, E>(vertex: $0)
            self.nodes[node.hashValue] = node
        }
    }
    
    open func remove(vertex: V) {
    
    }
    
    open func add(edge: E, from: V, to: V) {
        let start = nodes[from.hashValue]!
        let end = nodes[to.hashValue]!
        start.addAdj(node: end, edge: edge)
    }
    
    //public var nodes
    
    var nodes = Dictionary<Int, Node<V, E>>()
}

extension Graph {
    public func bfs(start: V) -> BFS<V, E> {
        return BFS(graph: self, start: start)
    }
    
    public func dfs(start: V) -> DFS<V, E> {
        return DFS(graph: self, start: start)
    }
}




public class ConstEdgeGraph<V: VertexProtocol> : Graph<V, Int> {
    
    public override init() {
        super.init()
    }
    
    public override init<S>(vertices: S) where S : Sequence, S.Iterator.Element == V {
        super.init(vertices: vertices)
    }
    
    public init<S, R>(vertices: S, edges: R) where S: Sequence, R: Sequence, S.Iterator.Element == V, R.Iterator.Element == (V, V) {
        super.init(vertices: vertices)
        add(edges: edges)
    }
    
    public func add<R>(edges: R) where R: Sequence, R.Iterator.Element == (V, V) {
        edges.forEach {
            self.add(edge: 1, from: $0.0, to: $0.1)
        }
    }
}


