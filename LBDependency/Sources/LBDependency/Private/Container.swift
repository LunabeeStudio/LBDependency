//
//  File.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import Foundation

final class Container: ObservableObject, @unchecked Sendable {
    static let shared = Container()

    private var values = LBDependencyValues()
    private let queue = DispatchQueue(label: "com.container.queue", attributes: .concurrent)

    subscript<T>(key: KeyPath<LBDependencyValues, T>) -> T {
        resolve(for: key)
    }

    subscript<T: Sendable>(key: WritableKeyPath<LBDependencyValues, T>) -> T {
        get { resolve(for: key) }
        set { register(key, value: newValue) }
    }

    private func resolve<T>(for key: KeyPath<LBDependencyValues, T>) -> T {
        queue.sync {
            values[keyPath: key]
        }
    }
    
    private func register<T: Sendable>(_ key: WritableKeyPath<LBDependencyValues, T>, value: T) {
        let valueToSet: T = value
        let keyToUse: WritableKeyPath<LBDependencyValues, T> = key
        queue.async(flags: .barrier) {
            self.values[keyPath: keyToUse] = valueToSet
        }
    }
}
