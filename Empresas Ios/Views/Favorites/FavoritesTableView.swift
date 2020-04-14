//
//  FavoritesTableView.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 13/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class FavoritesTableView: UIViewController {
    
    // MARK: - Properties
    
    var coordinator: FavoritesFlow?
    var favoriteCompanies: [Companies] = []
    var companyImage: UIImage?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 64
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Methods
    
    func customizeNavigationController() {
        title = "Favorite Companies"
        navigationController?.navigationBar.tintColor = .white
        let navigationBarBackgroundColor = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
        navigationController?.navigationBar.backgroundColor = navigationBarBackgroundColor
    }
}

// MARK: - UI Setup

extension FavoritesTableView {
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

extension FavoritesTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoriteItems.sharedInstance.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteCell
        cell.accessoryType = .disclosureIndicator
        cell.cellImage = UIImage(named: "imgEmpresaDefault")
        cell.cellTitle = FavoriteItems.sharedInstance.array[indexPath.row].enterprise_name
        cell.cellDescription = FavoriteItems.sharedInstance.array[indexPath.row].enterprise_type_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == FavoriteCell.EditingStyle.delete else { return }
        FavoriteItems.sharedInstance.array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
