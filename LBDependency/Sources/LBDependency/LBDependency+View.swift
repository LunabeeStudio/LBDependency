//
//  LBDependency+View.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import SwiftUI

public extension View {
    func dependency<DependencyType: Sendable>(_ keyPath: WritableKeyPath<LBDependencyValues, DependencyType>, value: DependencyType) -> some View {
        Container.shared[keyPath] = value
        return self
    }
}
