//
//  DomainManager.swift
//  
//
//  Created by Jiri Urbasek on 18.01.2022.
//

public final class DomainManager {
    public static func domainForEmail(_ email: String) throws -> String {
        let domain = "demo.com"
        print("Resolving domain for email: \(email). Result: \(domain)")
        return domain
    }
    
    public static func canRegisterFromDomain(_ domain: String, completion: @escaping (Result<Void, Error>) -> Void) {
        print("Sending Domain validation API request for domain: \(domain) ...")
        completion(.success(()))
    }
}
