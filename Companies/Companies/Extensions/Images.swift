//
//  Images.swift
//  Companies
//
//  Created by Daniel Gx on 27/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

extension UIImage {
    var ioasysLogo: UIImage {
        let image = "logoHome"
        if let path = Bundle.main.path(forResource: image, ofType: nil) {
            if let imageFinished = UIImage(contentsOfFile: path) {
                return imageFinished
            }
        }
        return #imageLiteral(resourceName: "logoHome")
    }
    
    var emailLogo: UIImage {
        let image = "icEmail"
        if let path = Bundle.main.path(forResource: image, ofType: nil) {
            if let imageFinished = UIImage(contentsOfFile: path) {
                return imageFinished
            }
        }
        return #imageLiteral(resourceName: "icEmail")
    }
    
    var passwordLogo: UIImage {
        let image = "icCadeado"
        if let path = Bundle.main.path(forResource: image, ofType: nil) {
            if let imageFinished = UIImage(contentsOfFile: path) {
                return imageFinished
            }
        }
        return #imageLiteral(resourceName: "icCadeado")
    }
}
