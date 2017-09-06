//
//  Random.swift
//  SwiftGraph
//
//  Created by Eugen Fedchenko on 4/1/17.
//  Copyright © 2017 gavrilaf. All rights reserved.
//

import Foundation

public struct Random {
    
    public static func intArray(size: Int) -> [Int] {
        return (0..<size).map { (_) -> Int in return Int(arc4random_uniform(1000)) }
    }
}

