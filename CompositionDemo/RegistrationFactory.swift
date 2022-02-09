//
//  RegistrationFactory.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 18.01.2022.
//

import UIKit
import Networking
import Core
import LoginFeature

final class RegistrationFactory {
    func makeViewController(emailValidator: EmailValidator, registrationAPI: RegistrationAPI) -> UIViewController {
        RegistrationViewController(
            registrationService: emailValidator.appending(service: registrationAPI)
        )
    }
}
