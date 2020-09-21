//
//  LoginViewController.swift
//  Companies
//
//  Created by Daniel Gx on 31/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//


import UIKit

public protocol LoginPresenting { //Declara na controller, escopo no Presenter
    func login()
}

class LoginViewController: UIViewController {
    
    
    // MARK: - Properties
    private lazy var loginView = LoginView()
    var presenter: LoginPresenting
    var presentable: LoginPresenter?
    
    init(presenter: LoginPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Actions
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        #warning("Qual o local correto de realizar o tratamento do teclado")

        loginView.emailText.resignFirstResponder()
        loginView.passwordText.resignFirstResponder()
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        startDismissKeyboard()
    }
    
    override func loadView() {
        view = loginView
        loginView.delegate = self
    }
}


// MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    
    #warning("Verificar como implementar este loginViewDelegate em conformidade com o presenter")
    
    func logIn() {
        presenter.login()
    }
    
    func initSpinner() {
        showSpinner()
    }
    
    func coordinatorToCompaniesView() {
        userDidLogin()
    }
}


//MARK: - LoginViewable
extension LoginViewController: LoginViewable {
    func getCredentials() -> Dictionary<String, String>? {
        guard let email = loginView.emailText.text, let password = loginView.passwordText.text else { return nil }
        let parameters = ["email", "password"]
        return [parameters.first ?? "" : email, parameters.last ?? "" : password]
    }
    
    func removeSpin() {
        removeSpinner()
    }
    
    func alert(withTitle title: String, andMessage message: String) {
        alertController(title, message: message)
    }
    
    func startDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func userDidLogin() {
        presenter.login()
    }
}
