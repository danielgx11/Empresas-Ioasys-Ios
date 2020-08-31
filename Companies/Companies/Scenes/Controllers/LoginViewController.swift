//
//  LoginViewController.swift
//  Companies
//
//  Created by Daniel Gx on 31/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class LoginViewController: UIViewController, Authentication {
    
    
    // MARK: - Properties
    private lazy var loginView = LoginView()
    lazy var presenter = LoginPresenter(with: self)
    var coordinator: LoginFlow?
    let provider = MoyaProvider<Session>()
    
    
    
    // MARK: - Actions
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        loginView.emailText.resignFirstResponder()
        loginView.passwordText.resignFirstResponder()
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
        startDismissKeyboard()
    }
    
    override func loadView() {
        view = loginView
        loginView.delegate = self
    }
    
    
    // MARK: - Methods
    func userDidLogin() {
        coordinator?.coordinateToCompaniesView()
    }
}


// MARK: - Presenter
extension LoginViewController: LoginViewPresenter {
    func hideNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func getCredentials() -> Dictionary<String, String>? {
        guard let email = loginView.emailText.text, let password = loginView.passwordText.text else { return nil }
        let parameters = ["email", "password"]
        return [parameters.first ?? "" : email, parameters.last ?? "" : password]
    }
    
    func startDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func login() {
        if let bodyParameters = getCredentials() {
            doLogin(withCredentials: bodyParameters) { [weak self] (error) in
                guard let self = self else { return }
                guard error == nil else {
                    self.removeSpinner()
                    self.alertController("Warning", message: error ?? "Unknown")
                    return
                }
                self.removeSpinner()
                self.userDidLogin()
            }
        }
    }
}


// MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func logIn() {
        login()
    }
    
    func initSpinner() {
        showSpinner()
    }
    
    func coordinatorToCompaniesView() {
        userDidLogin()
    }
}
