//
//  CompaniesView.swift
//  Companies
//
//  Created by Daniel Gx on 19/05/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya
import Lottie

class CompaniesView: UIViewController, StoryboardInitialize, GetCompanies {
    
    
    // MARK: - Properties
    
    var coordinator: CompaniesFlow?
    var enterprises: Enterprises?
    var animationView: AnimationView?
    let provider = MoyaProvider<Session>()
    private var decoder = JSONDecoder()
    
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
    
    
    // MARK: - Actions
    
    @objc func searchTapped() {
        setupSearchBar()
        setupTableView()
    }
    
    @objc func cancelTapped() {
        tableView.isHidden = true
        startLabel.isHidden = false
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationController()
        setupUI()
        
        tableView.keyboardDismissMode = .onDrag
                
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
    }
    
    
    // MARK: - Methods
    
    @objc func customizeNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.titleView = UIImageView(image: titleImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        navigationController?.navigationBar.barTintColor = barTintColor
        navigationController?.navigationBar.tintColor = .white
        
        cancelTapped()
    }
    
    func customCell(_ cell: UITableViewCell) {
        cell.textLabel?.font = UIFont(name: "Marker Felt", size: 18)
        cell.layer.borderWidth = 0.25
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = backgroundColor
    }
    
    func getCompanies(withTarget target: TargetType) {
        getCompanies(target: target) { [weak self] (response, error) in
            guard let self = self else { return }
            guard error != nil else {
                self.enterprises = response
                self.tableView.reloadData()
                return
            }
            self.alertController("Warning", message: error ?? "Unknown")
        }
    }
    
    func setupAnimation() {
        animationView = .init(name: "tableLoad")
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1.5
        tableView.addSubview(animationView!)
        animationView?.play()
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] (_) in
            guard let self = self else { return }
            self.animationView?.stop()
            self.animationView?.removeFromSuperview()
        }
    }
    
    func isPossible() -> Bool {
        if enterprises == nil {
            return true
        }
        return false
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
        if searchText.isEmpty {
            getCompanies(withTarget: Session.enterprise(.all))
        } else {
            getCompanies(withTarget: Session.enterprise(.filter(name: searchText)))
        }
    }
}

// MARK: - UI Setup

extension CompaniesView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        
        view.backgroundColor = backgroundColor
        
        view.addSubview(startLabel)
        
        startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func setupTableView() {
        if isPossible() {
            setupAnimation()
        }
        
        getCompanies(withTarget: Session.enterprise(.all))
        tableView.isHidden = false
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
