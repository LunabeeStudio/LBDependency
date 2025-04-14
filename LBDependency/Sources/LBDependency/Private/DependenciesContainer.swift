//
//  DependenciesContainer.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import Foundation

final class DependenciesContainer {
    private var storage: LazyDictionary<Any> = .init()

    func register<DependencyType>(for key: ObjectIdentifier, _ value: DependencyType) {
        storage.set(value: value, for: key)
    }

    func resolve(for key: ObjectIdentifier) -> Any? {
        return storage.value(for: key)
    }
}
