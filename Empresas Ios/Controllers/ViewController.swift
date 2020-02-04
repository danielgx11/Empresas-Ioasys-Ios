//
//  ViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit


class ViewController: UIViewController, Storyboarded {
    
    //MARK: -Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailError: UITextField!
    @IBOutlet weak var passwordError: UITextField!
    
    //MARK: -Variables
    
    weak var coordinator: MainCoordinator?
    
    //MARK: -Life cycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: -Funcs
    
    //Load alert
    func loadAllert(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    //Create alert
    func allertController (titulo: String, message: String){
        let alertController = UIAlertController(title: titulo, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailDigitado: UITextField! {
        didSet {
            emailDigitado.setPadding()
            emailDigitado.setBorderBotton()
        }
    }
    @IBOutlet weak var senhaDigitada: UITextField! {
        didSet {
            senhaDigitada.setPadding()
            senhaDigitada.setBorderBotton()
            senhaDigitada.isSecureTextEntry = true
        }
    }
    
    @IBAction func botaoEntrar(_ sender: Any) {
//        let username: String = emailDigitado.text!
//        let password: String = senhaDigitada.text!
        
        //MARK: -Set User&Password
        
        //Usuários e senha setados para facilitar a utilização do app
        
        let username: String = "testeapple@ioasys.com.br"
        let password: String = "12341234"
        
        AuthenticationAPI.loginWith(email: username, password: password){ (response, error, cache) in
            if response != nil { //Request ok
                self.coordinator?.empresasLista()
            }
            else if let error = error {
                if let urlResponse = error.urlResponse, urlResponse.statusCode == 401 {
                    self.allertController(titulo: "Error 401", message: "URLResponse error 401")
                }
                else if let responseObject = error.responseObject as? [String: Any], let errorMessage = responseObject["error_message"]{
                    self.allertController(titulo: "Response error", message: errorMessage as! String)
                }
                else {
                    self.coordinator?.start()
                }
            }
        }
        self.loadAllert()
    }
}

//MARK: -Extensions

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

