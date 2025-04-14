//
//  ContentView.swift
//  LBDependency
//
//  Created by Rémi Lanteri on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.text)
        }
        .padding()
        .dependency(\.myService, value: true)
        .task { await viewModel.start() }
    }
}

#Preview {
    ContentView()
}
