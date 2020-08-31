//
//  LoginViewPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

protocol LoginViewPresenter: class {
    func hideNavigationController()
    func getCredentials() -> Dictionary<String, String>?
    func login()
    func startDismissKeyboard()
}

class LoginPresenter {
    
    
    // MARK: - Properties
    private weak var view: LoginViewPresenter?
    
    init(with view: LoginViewPresenter) {
        self.view = view
    }
}
