//
//  RegistrationAPI.swift
//  
//
//  Created by Jiri Urbasek on 17.01.2022.
//

public final class RegistrationAPI {
    public init() {}
    
    public func registerEmail(_ email: String) async throws {
        print("Sending Registration API request for email: \(email) ...")
    }
}
