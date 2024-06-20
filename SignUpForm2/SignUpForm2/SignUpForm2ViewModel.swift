//
//  SignUpForm2ViewModel.swift
//  SignUpForm2
//
//  Created by 황규상 on 6/20/24.
//

import Foundation

class SignUpForm2ViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showUpdateDialog: Bool = false
}
