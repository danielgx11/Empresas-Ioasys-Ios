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


protocol CompaniesPresenting {
    func isPossible() -> Bool
    func getEnterprises(withTarget target: TargetType)
    func selectCompany(_ company: Companies)
}

class CompaniesViewController: UIViewController {
    
    
    // MARK: - Properties
    private lazy var companiesView = CompaniesView()
    var presenter: CompaniesPresenting?
    var animationView: AnimationView?
    
    init(presenter: CompaniesPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}


// MARK: - Viewable
extension CompaniesViewController: CompaniesViewable {
    @objc func customizeNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        navigationItem.titleView = UIImageView(image: titleImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
        navigationController?.navigationBar.barTintColor = UIColor().highPink
        navigationController?.navigationBar.tintColor = .white
        
        cancelTapped()
    }
    
    func alert(withTitle title: String, andMessage message: String) {
        alertController(title, message: message)
    }
    
    func reloadData() {
        companiesView.tableView.reloadData()
    }
    
    func parseCompanies(_ response: Enterprises?) {
        guard let enterprises = response else { return }
        companiesView.enterprises = enterprises
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
    
    func setupTableView() {
        if presenter?.isPossible() ?? false && animationView == nil {
            setupAnimation()
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] (_) in
            guard let self = self else { return }
            self.animationView?.stop()
            self.animationView?.removeFromSuperview()
        }
        
        presenter?.getEnterprises(withTarget: Session.enterprise(.all))
        companiesView.tableView.isHidden = false
        companiesView.startLabel.isHidden = true
        view.addSubview(companiesView.tableView)
        
        companiesView.tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        companiesView.tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @objc func searchTapped() {
        setupSearchBar()
        setupTableView()
    }
    
    @objc func cancelTapped() {
        companiesView.tableView.isHidden = true
        companiesView.startLabel.isHidden = false
    }
}


// MARK: - SearchController
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
            presenter?.getEnterprises(withTarget: Session.enterprise(.all))
        } else {
            presenter?.getEnterprises(withTarget: Session.enterprise(.filter(name: searchText)))
        }
    }
}


// MARK: - Search Controller
extension CompaniesViewController: CompaniesViewDelegate {
    func didSelectCompany(_ company: Companies) {
        presenter?.selectCompany(company)
    }
}
