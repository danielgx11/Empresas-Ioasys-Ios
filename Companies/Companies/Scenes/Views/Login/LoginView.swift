//
//  LoginView.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

protocol LoginViewDelegate: AnyObject {
    func logIn()
    func initSpinner()
    func coordinatorToCompaniesView()
}

class LoginView: UIView {
    
    
    // MARK: - Properties
    var delegate: LoginViewDelegate?
    
    let defaultImage: UIImageView = {
        let image = UIImageView(image: UIImage().ioasysLogo)
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "BEM VINDO AO EMPRESAS"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let licenseLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, contetur adipiscing elit. Nunc accumsan"
        label.font = UIFont(name: "System", size: 13)
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailLogo: UIImageView = {
        let image = UIImageView(image: UIImage().emailLogo)
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let passwordLogo: UIImageView = {
        let image = UIImageView(image: UIImage().passwordLogo)
        image.isUserInteractionEnabled = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("ENTRAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor().signInButtonColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    let firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let secondLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Actions
    @objc func signIn() {
        delegate?.logIn()
        delegate?.initSpinner()
    }
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}


// MARK: - UI Setup
extension LoginView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.backgroundColor = UIColor().wheat
        
        self.addSubview(defaultImage)
        self.addSubview(welcomeLabel)
        self.addSubview(licenseLabel)
        self.addSubview(firstLineView)
        self.addSubview(secondLineView)
        self.addSubview(emailText)
        self.addSubview(passwordText)
        self.addSubview(emailLogo)
        self.addSubview(passwordLogo)
        self.addSubview(signInButton)
        
        defaultImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 49).isActive = true
        defaultImage.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: -50).isActive = true
        defaultImage.widthAnchor.constraint(equalToConstant: 164).isActive = true
        defaultImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        defaultImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        welcomeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        licenseLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: -19).isActive = true
        licenseLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 56).isActive = true
        licenseLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -56).isActive = true
        licenseLabel.bottomAnchor.constraint(equalTo: emailText.topAnchor, constant: -48).isActive = true
        licenseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        firstLineView.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 4).isActive = true
        firstLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        firstLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        firstLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        secondLineView.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 4).isActive = true
        secondLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        secondLineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -26).isActive = true
        secondLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        emailLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 289.5).isActive = true
        emailLogo.widthAnchor.constraint(equalToConstant: 24).isActive = true
        emailLogo.centerXAnchor.constraint(equalTo: passwordLogo.centerXAnchor).isActive = true
        emailLogo.bottomAnchor.constraint(equalTo: firstLineView.topAnchor, constant: 2.5).isActive = true
        
        passwordLogo.topAnchor.constraint(equalTo: firstLineView.bottomAnchor, constant: 31).isActive = true
        passwordLogo.leadingAnchor.constraint(equalTo: firstLineView.leadingAnchor).isActive = true
        passwordLogo.widthAnchor.constraint(equalToConstant: 24).isActive = true
        passwordLogo.heightAnchor.constraint(equalToConstant: 24).isActive = true
        passwordLogo.centerXAnchor.constraint(equalTo: emailLogo.centerXAnchor).isActive = true

        emailText.leadingAnchor.constraint(equalTo: passwordText.leadingAnchor).isActive = true
        emailText.rightAnchor.constraint(equalTo: passwordText.rightAnchor).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 21).isActive = true
        emailText.centerYAnchor.constraint(equalTo: emailLogo.centerYAnchor).isActive = true
        
        passwordText.leadingAnchor.constraint(equalTo: licenseLabel.leadingAnchor).isActive = true
        passwordText.rightAnchor.constraint(equalTo: signInButton.rightAnchor).isActive = true
        passwordText.bottomAnchor.constraint(equalTo: secondLineView.topAnchor, constant: -4).isActive = true
        passwordText.centerYAnchor.constraint(equalTo: passwordLogo.centerYAnchor).isActive = true
        
        signInButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        signInButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -21).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 52.8).isActive = true
    }
}
