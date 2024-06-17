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
            VStack(alignment: .leading) {
                Text("Apples")
                    .font(.headline)
                Text("Eat one a day")
                    .font(.subheadline)
            }
            
            VStack(alignment: .leading) {
                Text("Banana")
                    .font(.headline)
                Text("High in potassium")
                    .font(.subheadline)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
