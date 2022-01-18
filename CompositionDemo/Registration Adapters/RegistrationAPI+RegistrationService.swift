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
        Task { [weak self] in
            do {
                try await self?.registerEmail(emailAddress)
                completion(.success(()))
            } catch {
                completion(.failure(.serverError(error)))
            }
        }
    }
}
