//
//  LoginView.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class LoginView: UIViewController, StoryboardInitialize {
    
    // MARK: - Properties
    
    var coordinator: LoginFlow?
    let provider = MoyaProvider<Company>()
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    // MARK: - Actions
    
    @IBAction func signInButton(_ sender: UIButton) {
        getCredentials()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
        }
    
    // MARK: - Methods
    
    func getCredentials() {
        guard let email = emailText.text  else { return } //TODO: Error handling login
        guard let password = passwordText.text else { return }
        Company.loginKey = email
        Company.passwordKey = password
        callAPI()
    }
    
    func hideNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func callAPI() {
        provider.request(.login) { result in
            switch result {
            case .success(let response):
                do {
                    debugPrint(try response.mapJSON())
                    self.coordinator?.coordinateToCompaniesView()
                } catch {
                    debugPrint("Error doCatch")
                }
            case .failure:
                debugPrint("Case failure")
            }
        }
    }
}
