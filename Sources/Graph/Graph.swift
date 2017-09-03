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
            let node = NodeT(vertex: $0)
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
    
    // MARK:
    /*public struct NodesSequence: Sequence, IteratorProtocol {
        public mutating func next() -> Node<V, E>? {
            return it.next()
        }
        
        //
        init(_ it: NodesDictLazyIt) { self.it = it }
        var it: NodesDictLazyIt
    }*/
    
    // MARK:
    typealias NodeT = Node<V, E>
    typealias NodesDict = Dictionary<Int, NodeT>
    //typealias NodesDictLazyIt = LazyMapIterator<NodesDict.Iterator, NodeT>
    
    var nodes = NodesDict()
}

// MARK:

extension Graph {
    public var allNodes: Set<Node<V, E>> {
        return Set(nodes.values)
    }
}

// MARK:

extension Graph {
    public func bfs(start: V) -> BFS<V, E> {
        return BFS(graph: self, start: start)
    }
    
    public func dfs(start: V) -> DFS<V, E> {
        return DFS(graph: self, start: start)
    }
}




