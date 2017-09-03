//
//  TopologicalSort.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/31/17.
//
//

import Foundation


public func topologicalSort<V: VertexProtocol, E: EdgeProtocol>(graph: Graph<V, E>) -> [V] {
    var sorted = [V]()
    
    var unmarked = graph.allNodes
    var tempMarks = Set<Node<V, E>>()
    
    var cycleFound = false
    
    /**
    if n has a permanent mark then return
    if n has a temporary mark then stop (not a DAG)
    if n is not marked (i.e. has not been visited yet) then
        mark n temporarily
        for each node m with an edge from n to m do
            visit(m)
        mark n permanently
        add n to head of L
    **/
    
    func visit(node: Node<V, E>) {
        guard !cycleFound else { return }
        
        guard unmarked.contains(node) else { return }
        
        guard !tempMarks.contains(node) else {
            cycleFound = true
            return
        }
        
        tempMarks.insert(node)
        
        node.adjacent.forEach {
            visit(node: $0)
        }
        
        tempMarks.remove(node)
        unmarked.remove(node)
        
        sorted.append(node.vertex)
    }
    
    while let node = unmarked.first {
        visit(node: node)
    }
    
    return sorted.reversed()
}
