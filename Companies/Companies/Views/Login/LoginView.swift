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
    let provider = MoyaProvider<Session>()
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    // MARK: - Actions
    
    @IBAction func signInButton(_ sender: UIButton) {
        if let bodyParameters = getCredentials() {
            doAuthentication(bodyParameters)
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
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
    
    func doAuthentication(_ bodyParameters: Dictionary<String, String>) {
        provider.request(.login(bodyParameters: bodyParameters)) { (result) in
            switch result {
            case .success(let response):
                guard 200...299 ~= response.statusCode else {
                    do {
                        let error = try JSONDecoder().decode(ResponseError.self, from: response.data)
                        DispatchQueue.main.async {
                            self.alertController("Warning", message: error.errors.first ?? "Unkwnown")
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            self.alertController("Warning", message: error.localizedDescription)
                        }
                    }
                    return
                }
                Authentication.shared?.retrieveAndSaveHeaders(response)
                DispatchQueue.main.async {
                    self.coordinator?.coordinateToCompaniesView()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alertController("Warning", message: error.localizedDescription)
                }
            }
        }
    }
}
