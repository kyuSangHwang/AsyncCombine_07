//
//  ListViewApp.swift
//  ListView
//
//  Created by 황규상 on 6/17/24.
//

import SwiftUI

@main
struct ListViewApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BooksListView()
            }
        }
    }
}
