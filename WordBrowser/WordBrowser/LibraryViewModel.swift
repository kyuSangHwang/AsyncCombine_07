//
//  LibraryViewModel.swift
//  WordBrowser
//
//  Created by 황규상 on 6/24/24.
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var randomWord: String = "partially"
    @Published var tips: [String] = ["Swift", "authentication", "authoriazation"]
    @Published var favorites: [String] = ["stunning", "brilliant", "marvelous"]
    
    @Published var filteredTips: [String] = [String]()
    @Published var filteredFavorites: [String] = [String]()
}
