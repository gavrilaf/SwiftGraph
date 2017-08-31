//
//  TopologicalSort.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/31/17.
//
//

import Foundation


public struct TopologicalSort<V: VertexProtocol, E: EdgeProtocol> {
    
    let graph: Graph<V, E>
    let visited = Set<V>()
    
    public init(graph: Graph<V, E>) {
        self.graph = graph
    }
    
    func sort() {
        
    
    }
}
