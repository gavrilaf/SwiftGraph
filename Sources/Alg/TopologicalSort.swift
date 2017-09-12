//
//  TopologicalSort.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/31/17.
//
//

import Foundation

// MARK:
public func topologicalSortFindAll<V: VertexProtocol, E: EdgeProtocol>(graph: Graph<V, E>) -> [[V]] {
    typealias NodeT = Node<V, E>
    var countedNodes = [NodeT : Int]()
    
    let allNodes = graph.allNodes
    allNodes.forEach { countedNodes[$0] = 0 }
    allNodes.forEach {
        $0.adjacent.forEach {
            countedNodes[$0] = (countedNodes[$0] ?? 0) + 1
        }
    }
    
    var result = [[V]]()
    var solution = [V]()
    var visited = Set<NodeT>()
    
    /**
     * Initialize all vertices as unvisited.
     * Now choose vertex which is unvisited and has zero indegree and decrease indegree
        of all those vertices by 1 (corresponding to removing edges) now add this vertex
        to result and call the recursive function again and backtrack.
     * After returning from function reset values of visited, result and indegree for enumeration
        of other possibilities.
     **/
    func findSolutions() {
        var flag = false
    
        for (node, indegree) in countedNodes {
            if indegree == 0 && !visited.contains(node) {
                node.adjacent.forEach { countedNodes[$0] = (countedNodes[$0] ?? 0) - 1 }
            
                solution.append(node.vertex)
                visited.insert(node)
                
                findSolutions()
                
                visited.remove(node)
                
                node.adjacent.forEach { countedNodes[$0] = (countedNodes[$0] ?? 0) + 1 }
                solution.remove(at: solution.count - 1)
                flag = true
            }
        }
        
        if !flag && !solution.isEmpty {
            result.append(solution)
        }
    }
    
    findSolutions()
    return result
}

// MARK: Find one solution
public func topologicalSort<V: VertexProtocol, E: EdgeProtocol>(graph: Graph<V, E>) -> [V] {
    var sorted = [V]()
    
    var unmarked = graph.allNodes
    print(unmarked)
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
    
    return cycleFound ? [] : sorted.reversed()
}
