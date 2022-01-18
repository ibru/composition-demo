//
//  SceneDelegate.swift
//  CompositionDemo
//
//  Created by Jiri Urbasek on 17.01.2022.
//

import UIKit
import Networking
import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = RegistrationFactory().makeViewController(emailValidator: EmailValidator(), registrationAPI: RegistrationAPI())
        window?.makeKeyAndVisible()
    }
}
