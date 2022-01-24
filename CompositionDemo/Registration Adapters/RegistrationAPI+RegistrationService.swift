//
//  RegistrationAPI+RegistrationService.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 24.01.2022.
//

import Foundation
import Networking
import LoginFeature

extension RegistrationAPI: RegistrationService {
    public func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void) {
        self.registerEmail(emailAddress) {
            completion($0.mapError { RegistrationError.serverError($0) })
        }
    }
}
