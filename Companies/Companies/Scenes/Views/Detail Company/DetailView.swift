//
//  DetailView.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    
    // MARK: - Properties    
    let enterpriseName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = ""
        label.font = UIFont(name: "Marker Felt", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enterpriseDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = ""
        label.font = UIFont(name: "System", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
extension DetailView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.backgroundColor = UIColor().wheat
        self.addSubview(enterpriseName)
        self.addSubview(enterpriseDescription)
        
        enterpriseName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        enterpriseName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        enterpriseName.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        enterpriseName.heightAnchor.constraint(equalToConstant: 64).isActive  = true
        
        enterpriseDescription.topAnchor.constraint(equalTo: enterpriseName.bottomAnchor).isActive = true
        enterpriseDescription.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        enterpriseDescription.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        enterpriseDescription.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
