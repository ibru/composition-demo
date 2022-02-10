//
//  EmailValidator+RegistrationService.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 24.01.2022.
//

import Foundation
import Core
import LoginFeature

extension EmailValidator: RegistrationService {
    public func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void) {
        guard isEmailValid(emailAddress, for: [.regex]) else {
            completion(.failure(.invalidEmail))
            return
        }
        completion(.success(()))
    }
}
