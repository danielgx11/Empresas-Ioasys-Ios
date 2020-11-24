//
//  LoginViewPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation
import Domain

public protocol LoginViewable: AnyObject { // Tudo que é feito na view
    func getCredentials() -> Dictionary<String, String>?
    func removeSpin()
    func alert(withTitle title: String, andMessage message: String)
    func startDismissKeyboard()
    func userDidLogin()
    func showEmailError(withMessage message: String)
    func showPasswordError(withMessage message: String)
}

public protocol LoginSceneCoordinating {
    func showCompaniesView()
}

protocol LoginPresentable { // Declara tudo q ta fazendo no presenter
    var view: LoginViewable? { get }
    var coordinator: LoginSceneCoordinating? { get }
}


class LoginPresenter: LoginPresentable {
    
    
    // MARK: - Properties
    internal weak var view: LoginViewable?
    internal var coordinator: LoginSceneCoordinating?
    private let formValidateUseCase: LoginFormValidateUseCaseProtocol
    
    required public init(withCoordinator coordinator: LoginSceneCoordinating, formValidateUseCase: LoginFormValidateUseCaseProtocol) {
        self.coordinator = coordinator
        self.formValidateUseCase = formValidateUseCase
    }
    
    func attach(_ view: LoginViewable) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenting, Authentication {
    public func login() {
        
        if let bodyParameters = view?.getCredentials() {
            doLogin(withCredentials: bodyParameters) { [weak self] (error) in
                guard let self = self else { return }
                guard error == nil else {
                    self.view?.removeSpin()
                    self.view?.alert(withTitle: "Warning", andMessage: error ?? "Unknown")
                    return
                }
                self.view?.removeSpin()
                #warning("Networking treatment")
//                self.coordinator?.showCompaniesView()
                guard
                    let email = bodyParameters["email"],
                    let password = bodyParameters["password"]
                else { return }
                
                let loginForm = LoginForm(email: email, password: password)
                self.formValidateUseCase.execute(loginForm) { (result) in
                    
                    switch result {
                    case .success():
                        self.coordinator?.showCompaniesView()
                    case .failure(let error):
                        switch error {
                        case .email(let emailError):
                            self.handleBusinnessEmailError(emailError)
                        case .password(let passwordError):
                            self.handleBusinnessPasswordError(passwordError)
                        }
                    }
                }
            }
        }
    }
    
    private func handleBusinnessEmailError(_ error: LoginFormValidateUseCaseError.Email) {
        switch error {
        case .empty:
            view?.showEmailError(withMessage: "Email field is empty, please try again.")
        case .invalid:
            view?.showEmailError(withMessage: "Email field is invalid, please try again.")
        }
    }
    
    private func handleBusinnessPasswordError(_ error: LoginFormValidateUseCaseError.Password) {
        switch error {
        case .empty:
            view?.showPasswordError(withMessage: "Password field is empty, please try again.")
        case .weak:
            view?.showPasswordError(withMessage: "Password is weak, please try again.")
        }
    }
}
