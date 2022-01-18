//
//  EmailValidator.swift
//  
//
//  Created by Jiri Urbasek on 17.01.2022.
//

open class EmailValidator {
    public enum ValidationCheck {
        case regex
        case length
        case specialCharracters
    }
    public init() {}
    
    public func isEmailValid(_ email: String, for validationChecks: [ValidationCheck]) -> Bool {
        print("Performing email validation for email: \(email) and checks: \(validationChecks) ...")
        return true
    }
}
