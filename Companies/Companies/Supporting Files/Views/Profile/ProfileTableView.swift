//
//  ProfileTableView.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 14/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class ProfileTableView: UIViewController, StoryboardInitializable {
    
    // MARK: - Properties
    
    var coordinator: ProfileFlow?
    var profiles: [Profile] = []
    var profileImage = UIImage(named: "ioasys")
    lazy var profileViewPresenter = ProfileViewPresenter(with: self)
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 64
        return tableView
    }()
    
    // MARK: - Actions
    
    @objc func logoutTapped() {
        coordinator?.coordinateToLogoutUser()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationController()
        setUser()
    }
}

// MARK: - UI Setup

extension ProfileTableView {
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
                                     tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)])
    }
    
}

// MARK: - TableView Delegate & DataSource

extension ProfileTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ProfileCell
        cell.accessoryType = .disclosureIndicator
        cell.cellImage = profiles[indexPath.row].profileImage
        cell.cellEmail = profiles[indexPath.row].profileEmail
        cell.cellCompany = profiles[indexPath.row].profileCompany
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        alertController(profiles[indexPath.row].profileCompany)
    }
    
}

// MARK: - Presenter

extension ProfileTableView: ProfilePresenter {
    
    func alertController(_ title: String) {
        let ac = UIAlertController(title: title, message: "That's the admin.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Of course, thank you!", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    func customizeNavigationController() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logoutButton"), style: .done, target: self, action: #selector(logoutTapped))
    }
    
    func setUser() {
        profiles.append(.init(profileEmail: "testeapple@ioasys.com.br", profileCompany: "Ioasys", profileImage: profileImage!))
    }
    
}

