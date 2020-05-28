//
//  DetailView.swift
//  Companies
//
//  Created by Daniel Gx on 28/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: DetailFlow?
    var enterprise: Companies?
    
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
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setLabels()
    }
    
    // MARK: - Methods
    
    func setLabels() {
        enterpriseName.text = enterprise?.enterpriseName
        enterpriseDescription.text = enterprise?.description
    }
}


// MARK: - UI Setup

extension DetailView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        view.backgroundColor = UIColor(red: 234/255, green: 233/255, blue: 213/255, alpha: 1)
        view.addSubview(enterpriseName)
        view.addSubview(enterpriseDescription)
        
        enterpriseName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        enterpriseName.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        enterpriseName.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        enterpriseName.heightAnchor.constraint(equalToConstant: 64).isActive  = true
        
        enterpriseDescription.topAnchor.constraint(equalTo: enterpriseName.bottomAnchor).isActive = true
        enterpriseDescription.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        enterpriseDescription.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        enterpriseDescription.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
