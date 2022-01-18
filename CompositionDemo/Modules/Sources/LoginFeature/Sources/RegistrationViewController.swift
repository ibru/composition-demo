//
//  RegistrationViewController.swift
//  
//
//  Created by Jiri Urbasek on 17.01.2022.
//

import UIKit
import Networking
import Core

open class RegistrationViewController: UIViewController {
    
    private let emailValidator: EmailValidator
    private let registrationAPI: RegistrationAPI
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Your email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonTouched), for: .touchUpInside)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    public init(emailValidator: EmailValidator, registrationAPI: RegistrationAPI) {
        self.emailValidator = emailValidator
        self.registrationAPI = registrationAPI
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("This class does not support NSCoder")
    }
    
    open override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            registerButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @IBAction func registerButtonTouched() {
        guard let email = emailTextField.text else { return }
        
        guard emailValidator.isEmailValid(email, for: [.regex]) else {
            showInvalidEmail()
            return
        }
        
        registrationAPI.registerEmail(email) { [weak self] result in
            switch result {
            case .success:
                self?.showRegistrationSuccess()
                
            case let .failure(error):
                self?.showError(error)
            }
        }
        
    }
    
    private func showInvalidEmail() {}
    
    private func showError(_ error: Error) {}
    
    private func showRegistrationSuccess() {}
}
