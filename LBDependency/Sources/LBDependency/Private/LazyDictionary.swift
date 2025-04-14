//
//  LazyDictionary.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import Foundation

struct LazyDictionary<U> {
    private var builderDictionary: [ObjectIdentifier: U] = .init()

    private let lock: NSLock = .init()

    mutating func set(value: U, for key: ObjectIdentifier) {
        builderDictionary[key] = value
    }

    mutating func value(for key: ObjectIdentifier) -> U? {
        lock.lock()
        if let entry = builderDictionary.first(where: { $0.key == key }) {
            let builder: U = entry.value
            lock.unlock()
            return builder
        } else {
            lock.unlock()
            return nil
        }
    }
}
