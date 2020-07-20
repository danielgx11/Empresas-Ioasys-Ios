//
//  LoginView.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class LoginView: UIViewController, StoryboardInitialize, Authentication {
    
    
    // MARK: - Properties
    
    var coordinator: LoginFlow?
    let provider = MoyaProvider<Session>()
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    // MARK: - Actions
    
    @IBAction func signInButton(_ sender: UIButton) {
        showSpinner()
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
    
    @objc func userDidLogin() {
        removeSpinner()
        coordinator?.coordinateToCompaniesView()
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        emailText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: - Methods
    
    func getCredentials() -> Dictionary<String, String>? {
        guard let email = emailText.text, let password = passwordText.text else { return nil}
        return ["email" : email, "password" : password]
    }
    
    func hideNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
}
