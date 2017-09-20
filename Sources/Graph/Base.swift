//
//  Base.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 9/3/17.
//
//

import Foundation

public protocol VertexProtocol: Hashable {
}

public protocol EdgeProtocol {
    var weight: Int { get }
}
