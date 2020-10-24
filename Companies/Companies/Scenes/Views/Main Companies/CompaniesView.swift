//
//  CompaniesView.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit

protocol CompaniesViewDelegate: AnyObject {
    func didSelectCompany(_ company: Companies)
}

class CompaniesView: UIView {
    
    
    // MARK: - Properties
    var delegate: CompaniesViewDelegate?
    var enterprises: Enterprises?

    lazy var searchBar: UISearchBar = UISearchBar()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "Clique na busca para iniciar"
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
    
    
    // MARK: - Methods
    func customCell(_ cell: UITableViewCell) {
        cell.textLabel?.font = UIFont(name: "Marker Felt", size: 18)
        cell.layer.borderWidth = 0.25
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor().wheat
    }
}


// MARK: - UI Setup
extension CompaniesView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        self.backgroundColor = UIColor().wheat
        
        self.addSubview(startLabel)
        
        startLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true 
        startLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}


// MARK: - TableView Delegate and DataSource
extension CompaniesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enterprises?.enterprises?.count ?? 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        customCell(cell)
        cell.textLabel?.text = enterprises?.enterprises?[indexPath.row].enterpriseName?.uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let company = enterprises?.enterprises?[indexPath.row] else { return }
        delegate?.didSelectCompany(company)
    }
}
