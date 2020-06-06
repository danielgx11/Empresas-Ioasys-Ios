//
//  Util.swift
//  Companies
//
//  Created by Daniel Gx on 04/06/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
        
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView?.addSubview(activityIndicator)
        self.view.addSubview(aView!)
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
