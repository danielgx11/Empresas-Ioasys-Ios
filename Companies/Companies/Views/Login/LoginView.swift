//
//  LoginView.swift
//  Companies
//
//  Created by Daniel Gx on 18/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class LoginView: UIViewController, StoryboardInitialize {
    
    // MARK: - Properties
    
    var coordinator: LoginFlow?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationController()
    }
    
    // MARK: - Methods
    
    func hideNavigationController() {
        navigationController?.isNavigationBarHidden = true
    }
}
