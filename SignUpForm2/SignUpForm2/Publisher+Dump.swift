//
//  Publisher+Dump.swift
//  SignUpForm2
//
//  Created by 황규상 on 6/20/24.
//

import Foundation
import Combine

extension Publisher {
    func dump() -> AnyPublisher<Self.Output, Self.Failure> {
        handleEvents(receiveOutput:  { value in
            Swift.dump(value)
        })
        .eraseToAnyPublisher()
    }
}
