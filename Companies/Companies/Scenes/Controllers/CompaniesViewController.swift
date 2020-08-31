//
//  CompaniesViewController.swift
//  Companies
//
//  Created by Daniel Gx on 24/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import UIKit
import Moya
import Lottie

class CompaniesViewController: UIViewController, GetCompanies {
    
    
    // MARK: - Properties
    private lazy var companiesView = CompaniesView()
    lazy var presenter = CompaniesPresenter(with: self)
    var coordinator: CompaniesFlow?
    var animationView: AnimationView?
    
    
    // MARK: - Actions
    @objc func searchTapped() {
        setupSearchBar()
        setupTableView()
    }
    
    @objc func cancelTapped() {
        companiesView.tableView.isHidden = true
        companiesView.startLabel.isHidden = false
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = companiesView
        navigationController?.isNavigationBarHidden = false
        customizeNavigationController()
        companiesView.delegate = self
    }
    
    func setupTableView() {
        if presenter.isPossible() && animationView == nil {
            setupAnimation()
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] (_) in
            guard let self = self else { return }
            self.animationView?.stop()
            self.animationView?.removeFromSuperview()
        }
        
        getCompanies(withTarget: Session.enterprise(.all))
        companiesView.tableView.isHidden = false
        companiesView.startLabel.isHidden = true
        view.addSubview(companiesView.tableView)
        
        companiesView.tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        companiesView.tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}


// MARK: - Presenter
extension CompaniesViewController: CompaniesViewPresenter {
    @objc func customizeNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.titleView = UIImageView(image: titleImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        navigationController?.navigationBar.barTintColor = UIColor().highPink
        navigationController?.navigationBar.tintColor = .white
        
        cancelTapped()
    }
    
    func getCompanies(withTarget target: TargetType) {
        getCompanies(target: target) { [weak self] (response, error) in
            guard let self = self else { return }
            guard error != nil else {
                self.companiesView.enterprises = response
                CompaniesPresenter.possible = true
                self.companiesView.tableView.reloadData()
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
        companiesView.tableView.addSubview(animationView!)
        animationView?.play()
    }
    
    func customizeTableView() {
        companiesView.tableView.keyboardDismissMode = .onDrag
        companiesView.tableView.rowHeight = UITableView.automaticDimension
        companiesView.tableView.estimatedRowHeight = 64
    }
}


// MARK: - Search Controller
extension CompaniesViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        companiesView.searchBar.searchBarStyle = .prominent
        companiesView.searchBar.placeholder = "Search Companies"
        companiesView.searchBar.sizeToFit()
        companiesView.searchBar.isTranslucent = false
        companiesView.searchBar.delegate = self
        companiesView.searchBar.searchTextField.backgroundColor = .white
        navigationItem.titleView = companiesView.searchBar
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


// MARK: - Search Controller
extension CompaniesViewController: CompaniesViewDelegate {
    func didSelectCompany(_ company: Companies) {
        coordinator?.coordinateToCompanyDetail(company: company)
    }
}
