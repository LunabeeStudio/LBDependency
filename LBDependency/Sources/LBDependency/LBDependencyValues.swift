//
//  LBDependencyValues.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import Foundation

public struct LBDependencyValues {
    private let container: DependenciesContainer = .init()

    public subscript<K>(key: K.Type) -> K.DependencyType where K: LBDependencyKey {
        get {
            container.resolve(for: ObjectIdentifier(K.self)) as? K.DependencyType ?? K.defaultValue
        }
        set {
            container.register(for: ObjectIdentifier(K.self), newValue)
        }
    }

    subscript<Value>(keyPath: WritableKeyPath<LBDependencyValues, Value>) -> Value {
        get { self[keyPath: keyPath] }
        set { self[keyPath: keyPath] = newValue }
    }
}
