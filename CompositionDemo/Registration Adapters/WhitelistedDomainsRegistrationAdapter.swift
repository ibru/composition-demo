//
//  WhitelistedDomainsRegistrationAdapter.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 09.02.2022.
//

import Foundation
import Security
import LoginFeature

final class WhitelistedDomainsRegistrationAdapter: RegistrationService {
    func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void) {
        do {
            let domain = try DomainManager.domainForEmail(emailAddress)
            DomainManager.canRegisterFromDomain(domain) {
                completion($0.mapError { RegistrationError.serverError($0) })
            }
        } catch {
            completion(.failure(RegistrationError.serverError(error)))
        }
    }
}
