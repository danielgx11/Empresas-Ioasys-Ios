//
//  Login.swift
//  Companies
//
//  Created by Daniel Gx on 03/06/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation

@objc protocol Login {
    @objc func userDidLogin()
}

extension Login {
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(userDidLogin), name: .didReceiveData , object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self, name: .didReceiveData, object: nil)
    }
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didCompleteTask = Notification.Name("didCompleteTask")
}
