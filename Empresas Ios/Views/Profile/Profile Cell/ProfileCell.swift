//
//  ProfileCell.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 15/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    // MARK: - Properties
    
    var cellEmail: String?
    var cellCompany: String?
    var cellImage: UIImage?
    
    var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 32
        profileImageView.clipsToBounds = true
        return profileImageView
    }()
    
    var profileEmail: UILabel = {
        let emailLabel = UILabel()
        emailLabel.font = UIFont.systemFont(ofSize: 20)
        emailLabel.textColor = .black
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    var profileCompany: UILabel = {
        let companyLabel = UILabel()
        companyLabel.font = UIFont.systemFont(ofSize: 16)
        companyLabel.textColor = .systemGray3
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        return companyLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(profileImageView)
        self.addSubview(profileEmail)
        self.addSubview(profileCompany)
        
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let cellEmail = cellEmail {
            profileEmail.text = cellEmail
        }
        if let cellCompany = cellCompany {
            profileCompany.text = cellCompany
        }
        if let cellImage = cellImage {
            profileImageView.image = cellImage
        }
    }
    
    // MARK: - Methods
    
    func setupLayoutConstraints() {
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        
        profileEmail.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        profileEmail.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        profileEmail.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        profileEmail.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, constant: -8).isActive = true
        
        profileCompany.topAnchor.constraint(equalTo: profileEmail.bottomAnchor, constant: -8).isActive = true
        profileCompany.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        profileCompany.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        profileCompany.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
