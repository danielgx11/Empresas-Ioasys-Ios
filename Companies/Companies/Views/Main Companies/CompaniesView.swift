//
//  CompaniesView.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya

class CompaniesView: UIViewController, StoryboardInitialize {
    
    // MARK: - Properties
    
    var coordinator: CompaniesFlow?
    var enterprises: Enterprises?
    let provider = MoyaProvider<Company>()
    lazy var searchBar: UISearchBar = UISearchBar()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reusableCell")
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
    
    // MARK: - Actions
    
    @objc func searchTapped() {
        setupSearchBar()
        setupTableView()
    }
    
    @objc func logoutTapped() {
        //coordinator?.coordinateToLogout()
    }
    
    @objc func cancelTapped() {
        //coordinator?.coordinateToStart()
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationController()
        setupUI()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
    }
    
    // MARK: - Methods
    
    @objc func customizeNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logoutTapped))
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = .white
        
        cancelTapped()
    }
    
    func customCell( _ cell: UITableViewCell) {
        cell.textLabel?.font = UIFont(name: "Marker Felt", size: 18)
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor(red: 234/255, green: 233/255, blue: 213/255, alpha: 1)
    }
    
    func getCompanies() {
        self.provider.request(.companies) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    self.enterprises = try JSONDecoder().decode(Enterprises.self, from: response.data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    debugPrint("Error DoCatch")
                }
                break
            case .failure(let error):
                debugPrint(error.localizedDescription)
                break
            }
        }
    }
}

// MARK: - Search Controller

extension CompaniesView: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Search Companies"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .white
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(customizeNavigationController))
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
}

// MARK: - UI Setup

extension CompaniesView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        view.backgroundColor = UIColor(red: 234/255, green: 233/255, blue: 213/255, alpha: 1)
        
        view.addSubview(startLabel)
        
        startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func setupTableView() {
        getCompanies()
        startLabel.isHidden = true
        view.addSubview(tableView)
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
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
        coordinator?.coordinateToCompanyDetail(company: company)
    }
}
