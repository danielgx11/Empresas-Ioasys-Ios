//
//  LoginViewPresenter.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 23/03/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import Foundation

protocol PresenterViewController: class {
    func loadAllert()
    func allertController (title: String, message: String)
}

class LoginViewPresenter {
    
    // MARK: -Variables
    
    weak var view: PresenterViewController?
    

}
