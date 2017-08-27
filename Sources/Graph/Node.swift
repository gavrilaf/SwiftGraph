//
//  Node.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 8/20/17.
//
//

import Foundation

public protocol VertexProtocol: Hashable, Equatable {
    
    var id: String { get }
}

public protocol EdgeProtocol {
    
    var weight: Int { get }
}

extension Int: VertexProtocol {
    public var id: String { return String(self) }
}

extension String: VertexProtocol {
    
    public var id: String { return self }
}

extension Int: EdgeProtocol {
    
    public var weight: Int { return self }
}

