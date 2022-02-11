//
//  FallbackRegistrationService.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 11.02.2022.
//

import Foundation
import LoginFeature

final class FallbackRegistrationService: RegistrationService {
    private let initialService: RegistrationService
    private let appendedService: RegistrationService
    
    init(initialService: RegistrationService, fallbackService: RegistrationService) {
        self.initialService = initialService
        self.appendedService = fallbackService
    }
    
    func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void) {
        initialService.registerUser(withEmail: emailAddress) { [weak self] result in
            switch result {
            case .success:
                completion(result)
            case .failure:
                self?.appendedService.registerUser(withEmail: emailAddress, completion: completion)
            }
        }
    }
}

extension RegistrationService {
    func fallback(service fallbackService: RegistrationService) -> RegistrationService {
        FallbackRegistrationService(initialService: self, fallbackService: fallbackService)
    }
}
