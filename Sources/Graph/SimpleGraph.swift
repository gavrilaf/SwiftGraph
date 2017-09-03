//
//  SimpleGraph.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/3/17.
//
//

import Foundation

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

// MARK:

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
