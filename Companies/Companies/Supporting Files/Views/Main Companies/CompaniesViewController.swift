//
//  CompaniesViewController.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 01/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController, StoryboardInitializable {
    
        //MARK: -Variables
    
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/EmpresasViewController.swift
        weak var coodinator: MainCoordinator?
        var companies: [Companies] = []
        let searchBar = UISearchBar()
        var searchButton: UIBarButtonItem?
        var backButton: UIBarButtonItem?
        
        
        //MARK: -Life cycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
           
            //Hide load alert
            dismiss(animated: false, completion: nil)
            
            searchBar.delegate = self as? UISearchBarDelegate
            searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(EmpresasViewController.addTapped(_:)))
            backButton = UIBarButtonItem(title: "Sair", style: .done, target: self, action: #selector(EmpresasViewController.logoutTapped(_:)))
            let bgColorNavigation = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
            UINavigationBar.appearance().barTintColor = bgColorNavigation
            UINavigationBar.appearance().tintColor = .white
            self.setUpNavBar()
            
        }
        
        //MARK: -Funcs
    
        @objc func addTapped(_ sender:UIBarButtonItem!){
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.titleView?.isHidden = true
            self.navigationItem.rightBarButtonItem = nil
            self.coodinator?.tableViewList()
        }
    
        func setUpNavBar(){
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationItem.hidesBackButton = true
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationItem.hidesSearchBarWhenScrolling = false
            self.navigationItem.rightBarButtonItem = searchButton
            self.navigationItem.leftBarButtonItem = backButton
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
            }
    
        @objc func logoutTapped(_ sender:UIBarButtonItem!){
            self.coodinator?.start()
        }
    
        private func addNavBarImage() {
            let image = UIImage(named: "logoHome.png")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 136, y: 30, width: 102.7, height: 25)
            imageView.contentMode = .scaleAspectFit
            self.navigationItem.titleView = imageView
    }
=======
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
    
>>>>>>> develop:Empresas Ios/Views/Main Companies/CompaniesViewController.swift
}
