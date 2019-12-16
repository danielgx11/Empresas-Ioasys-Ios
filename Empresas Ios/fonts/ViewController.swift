//
//  ViewController.swift
//  Empresas Ios
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    //Coordinator main
    weak var coordinator: MainCoordinator?
    
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
        // Do any additional setup after loading the view.
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
        
        let username: String = "testeapple@ioasys.com.br"
        let password: String = "12341234"
        
        AuthenticationAPI.loginWith(email: username, password: password){ (response, error, cache) in
            if response != nil {
                //Request Ok!
                self.coordinator?.empresasLista()
            }
            else if let error = error {
                if let urlResponse = error.urlResponse, urlResponse.statusCode == 401 {
                    //TODO: Logout user
                }
                else if let responseObject = error.responseObject as? [String: Any], let errorMessage = responseObject["error_message"]{
                    //TODO: Show error message
                }
                else {
                    //logout user
                    //coordinator?.ViewController()
                }
            }
        }
        
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
