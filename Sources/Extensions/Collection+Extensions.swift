//
//  Collection+Extensions.swift
//
//
//  Created by Joohee Kim on 8/3/24.
//

import Foundation

public extension Collection {
    func count(where condition: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(condition).count
    }
}
