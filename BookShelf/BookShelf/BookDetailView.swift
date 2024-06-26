//
//  BookDetailView.swift
//  BookShelf
//
//  Created by 황규상 on 6/17/24.
//

import SwiftUI

struct BookDetailView: View {
    @Binding var book: Book
    @State var showEditBookView = false
    
    var body: some View {
        Form {
            Text(book.title)
            Image(book.largeCoverImageName)
                .resizable()
                .scaledToFit()
                .shadow(radius: 10)
                .padding()
            Button(action: { showEditBookView.toggle() }) {
                Label("Edit", systemImage: "pencil")
            }
            Label(book.author, systemImage: "person.crop.rectangle")
            Label("ISBN: \(book.isbn)", systemImage: "number")
            Label("\(book.pages) pages", systemImage: "book")
            Toggle("Read", isOn: .constant(book.isRead))
        }
        .navigationTitle(book.title)
        .sheet(isPresented: $showEditBookView) {
            BookEditView(book: $book)
        }
    }
}

#Preview {
    BookDetailView(book: .constant(Book(title: "Test", author: "Test", isbn: "Test", pages: 0)))
}
