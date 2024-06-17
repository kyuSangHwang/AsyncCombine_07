//
//  ContentView.swift
//  ListView
//
//  Created by 황규상 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Hello, world!")
            Text("Hello, SwiftUI!")
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
