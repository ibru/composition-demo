//
//  RegistrationViewController.swift
//  
//
//  Created by Jiri Urbasek on 17.01.2022.
//

import UIKit

public enum RegistrationError: Error {
    case invalidEmail
    case serverError(Error)
}

public protocol RegistrationService {
    func registerUser(withEmail emailAddress: String, completion: @escaping (Result<Void, RegistrationError>) -> Void)
}

open class RegistrationViewController: UIViewController {
    
    private let registrationService: RegistrationService
    
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
    
    public init(registrationService: RegistrationService) {
        self.registrationService = registrationService
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
        
        registerWith(email: email)
    }
    
    private func showInvalidEmail() {}
    
    private func showError(_ error: Error) {}
    
    private func showRegistrationSuccess() {}
}

extension RegistrationViewController {
    func registerWith(email: String) {
        registrationService.registerUser(withEmail: email) { [weak self] result in
            switch result {
            case .success:
                self?.showRegistrationSuccess()
                
            case let .failure(error):
                switch error {
                case .invalidEmail:
                    self?.showInvalidEmail()
                
                case let .serverError(error):
                    self?.showError(error)
                }
            }
        }
    }
}
