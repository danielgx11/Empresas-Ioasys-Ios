//
//  LoginViewPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

public protocol LoginViewable: AnyObject { // Tudo que é feito na view
    func getCredentials() -> Dictionary<String, String>?
    func removeSpin()
    func alert(withTitle title: String, andMessage message: String)
    func startDismissKeyboard()
    func userDidLogin()
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
    
    required public init(withCoordinator coordinator: LoginSceneCoordinating) {
        self.coordinator = coordinator
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
                self.coordinator?.showCompaniesView()
            }
        }
    }
}
