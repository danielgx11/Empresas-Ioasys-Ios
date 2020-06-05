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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Methods
    
    
    func getCredentials() -> Dictionary<String, String>? {
        guard let email = emailText.text, let password = passwordText.text else { return nil}
        return ["email" : email, "password" : password]
    }
    
    func hideNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func alertController(_ title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(ac, animated: true)
    }
}
