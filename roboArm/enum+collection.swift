//
//  EnumCollection.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import Foundation

public protocol EnumCollection: Hashable {
    static var allValues: [Self] { get }
}

public extension EnumCollection {
    internal static func cases() -> AnySequence<Self> {
        return AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current: Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: Self.self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else { return nil }
                raw += 1
                return current
            }
        }
    }
    
    /// The order the cases have been declared dictates order here, not their values.
    public static var allValues: [Self] {
        return Array(self.cases())
    }
}
