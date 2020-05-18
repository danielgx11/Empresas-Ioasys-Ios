//
//  CompaniesViewController.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController, StoryboardInitializable {
    
    // MARK: -Variables
    
    lazy var companyPresenter = CompanyViewPresenter(with: self)
    var coordinator: CompaniesFlow?
    var companies: [Companies] = []
    let searchBar = UISearchBar()
    var searchButton: UIBarButtonItem?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }

    // MARK: - Methods
    
    @objc func addTapped(){
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView?.isHidden = true
        navigationItem.rightBarButtonItem = nil
        coordinator?.coordinateToListOfCompanies()
    }
}

// MARK: - Setup Company Presenter

extension CompaniesViewController: CompanyPresenter {
    func setNavigationBar () {
        searchBar.delegate = self as? UISearchBarDelegate
        searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(addTapped))
        UINavigationBar.appearance().barTintColor = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .white
        self.setUpNavBar()
    }
    
    func setUpNavBar(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
    }
    
    func addNavBarImage() {
        let image = UIImage(named: "logoHome.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 136, y: 30, width: 102.7, height: 25)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
}
