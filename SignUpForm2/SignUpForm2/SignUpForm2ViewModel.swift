//
//  SignUpForm2ViewModel.swift
//  SignUpForm2
//
//  Created by 황규상 on 6/20/24.
//

import Foundation
import Combine

class SignUpForm2ViewModel: ObservableObject {
    typealias Available = Result<Bool, Error>
    
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showUpdateDialog: Bool = false
    
    private var authenticationService = AuthenticationService()
    
    private lazy var isUsernameAvailablePublisher: AnyPublisher<Available, Never> = {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { username -> AnyPublisher<Available,Never> in
                self.authenticationService.checkUserNameAvailablePublisher(userName: username)
                    .asResult()
            }
            .share()
            .eraseToAnyPublisher()
    }()
}
