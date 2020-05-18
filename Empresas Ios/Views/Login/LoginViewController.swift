//
//  ViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, StoryboardInitializable {
    
    // MARK: - Variables
    
    lazy var loginPresenter = LoginViewPresenter(with: self)
    var coordinator: LoginFlow?
    
    // MARK: -Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailError: UITextField!
    @IBOutlet weak var passwordError: UITextField!
    
    @IBOutlet weak var typedEmail: UITextField! {
        didSet {
            typedEmail.setPadding()
            typedEmail.setBorderBotton()
        }
    }
    @IBOutlet weak var typedPassword: UITextField! {
        didSet {
            typedPassword.setPadding()
            typedPassword.setBorderBotton()
            typedPassword.isSecureTextEntry = true
        }
    }
    
    // MARK: -Actions Button
    
    @IBAction func loginButton(_ sender: Any) {
//        let username: String = typedEmail.text!
//        let password: String = typedPassword.text!
        let username = "testeapple@ioasys.com.br"
        let password = "12341234"
        
        AuthenticationAPI.loginWith(email: username, password: password){ (response, error, cache) in
            if response != nil {
                self.loadAllert()
            }
            else if let error = error {
                if let urlResponse = error.urlResponse, urlResponse.statusCode == 401 {
                    self.allertController(title: "Error 401", message: "URLResponse error 401")
                }
                else if let responseObject = error.responseObject as? [String: Any], let errorMessage = responseObject["error_message"]{
                    self.allertController(title: "Response error", message: errorMessage as! String)
                }
                else {
                    debugPrint("Request failed...")
                }
            }
        }
    }
    
    //MARK: -Life cycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: -Extensions

extension LoginViewController: LoginPresenter {
    
    func loadAllert(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        alert.dismiss(animated: true, completion: nil)
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: {Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            self.dismiss(animated: true, completion: self.coordinator?.coordinateToTabBar)
            }})
    }
    
    func allertController (title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UITextField {
    
    func setPadding () {
        let frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 0.0)
        let paddingView = UIView(frame: frame)
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBorderBotton() {
        let color = UIColor.darkGray.cgColor
        let offset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowColor =  color
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

