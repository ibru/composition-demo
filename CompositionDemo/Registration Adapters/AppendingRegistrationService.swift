//
//  AppendingRegistrationService.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 24.01.2022.
//

import Foundation
import LoginFeature

final class AppendingRegistrationService: RegistrationService {
    private let initialService: RegistrationService
    private let appendedService: RegistrationService
    
    init(initialService: RegistrationService, appendedService: RegistrationService) {
        self.initialService = initialService
        self.appendedService = appendedService
    }
    
    func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void) {
        initialService.registerUser(withEmail: emailAddress) { [weak self] result in
            switch result {
            case .success:
                self?.appendedService.registerUser(withEmail: emailAddress, completion: completion)
            case .failure:
                completion(result)
            }
        }
    }
}

extension RegistrationService {
    func appending(service appendedService: RegistrationService) -> RegistrationService {
        AppendingRegistrationService(initialService: self, appendedService: appendedService)
    }
}
