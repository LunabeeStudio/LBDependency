//
//  ContentViewModel.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import SwiftUI
import LBDependency

@MainActor
class ContentViewModel: ObservableObject {
    @LBDependency(\.myService) private var myService

    @Published var text: String = ""

    func start() async {
        try? await Task.sleep(for: .seconds(2))
        text = myService.description
    }
}

struct MyServiceKey: LBDependencyKey {
    static let defaultValue: Bool = false
}

extension LBDependencyValues {
    var myService: Bool {
        get { self[MyServiceKey.self] }
        set { self[MyServiceKey.self] = newValue }
    }
}
