//
//  BookDetailView.swift
//  BookShelf
//
//  Created by 황규상 on 6/17/24.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    BookDetailView(book: .constant(Book(title: "Test", author: "Test", isbn: "Test", pages: 0)))
}
