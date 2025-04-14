// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@propertyWrapper @MainActor
public struct Dependency<DependencyType>: DynamicProperty {
    @ObservedObject private var container = Container.shared

    private let keyPath: KeyPath<LBDependencyValues, DependencyType>

    init(_ keyPath: KeyPath<LBDependencyValues, DependencyType>) {
        self.keyPath = keyPath
    }

    public var wrappedValue: DependencyType {
        container[keyPath]
    }
}
