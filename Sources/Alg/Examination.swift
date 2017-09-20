//
//  Examination.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/18/17.
//
//

import Foundation

extension Graph {
    enum NodeColor {
        case white
        case grey
        case black
    }
}

extension Graph {
    
    /// Is Directed Acyclic Graph? True if graph does not contain cycles
    public func isDAG() -> Bool {
        var colors = [V: NodeColor]()
        
        func findCycle(_ node: Node<V, E>) -> Bool {
            colors[node.vertex] = .grey
            for adj in node.adjacent {
                if colors[adj.vertex] == .grey {
                    return true
                }
                if colors[adj.vertex] == nil && findCycle(adj) {
                    return true
                }
            }
            colors[node.vertex] = .black
            return false
        }
        
        for node in self.nodes.values {
            if colors[node.vertex] == nil {
                if findCycle(node) {
                    return false
                }
            }
        }
        
        return true
    }
}
