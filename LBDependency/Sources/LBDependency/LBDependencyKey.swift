//
//  File.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

public protocol LBDependencyKey {
    associatedtype DependencyType
    /// The default value for the dependency key.
    static var defaultValue: Self.DependencyType { get }
}
