//
//  ListarEmpresasTableViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit
import Kingfisher

class ListCompaniesTableView: UIViewController, StoryboardInitializable {
    
    //MARK: -Outlets
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: -Variables
    
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
    weak var coordinator: MainCoordinator?
=======
    lazy var listCompaniesPresenter = ListCompaniesViewPresenter(with: self)
    var coordinator: ListCompaniesFlow?
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
    let searchBar = UISearchBar()
    var cancelButton: UIBarButtonItem?
    var companies: [Companies] = []{
        didSet {
            self.tableView.reloadData()
        }
    }
    
    //MARK: -Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
        navigationItem.hidesBackButton = true
=======
        setTableView()
        setUpNavBar()
        setUpSeachBar()
    }
        
    //MARK: - Funcs
}


// MARK: - Extensions

extension ListCompaniesTableView: ListCompanyPresenter {
    
    func setTableView() {
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        // Hide bottom lines of the cells
        tableView.tableFooterView = UIView()
        
        self.setUpNavBar()
        self.setUpSeachBar()
    }
  
    //MARK: -Funcs
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchBar.text! != ""){
            
            CompaniesAPI.getCompanies(enterprise_name: searchBar.text!){ (response, error, cache) in
                if let response = response {
                    self.companies = response
                } else if let error = error {
                    if let urlResponse = error.urlResponse, urlResponse.statusCode == 401 {
                    } else if let responseObject = error.responseObject as? [String: Any], let _ = responseObject["error_message"] {
                    }
                }
            }
        }
        else {
            self.companies = []
        }
    }
    
        @objc func cancelTapped(_ sender:UIBarButtonItem!){
            self.navigationItem.searchController = nil
    }
    
    func setUpNavBar(){
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
=======
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesSearchBarWhenScrolling = false
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.white
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
    }
    
    func setUpSeachBar(){
        searchBar.searchTextField.backgroundColor = .white
        searchBar.text = ""
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Pesquisar"
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.white
        searchBar.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        searchBar.becomeFirstResponder()
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
        self.navigationItem.titleView = searchBar
        }
    
    //Ocult SearchBar
    private func hideSearchBar() {
        self.navigationItem.titleView = nil // Remove a searchBar da navigation
        self.searchBar.resignFirstResponder() // Esconde o teclado
        self.coordinator?.start()
=======
        navigationItem.titleView = searchBar
    }
    
    func hideSearchBar() {
        self.navigationItem.titleView = nil
        self.searchBar.resignFirstResponder()
        coordinator?.coordinateToCancelSearch()
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
    }
    
    private func addNavBarImage() {
        let image = UIImage(named: "logoHome.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 136, y: 30, width: 102.7, height: 25)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}

// MARK: -Table view data source and delegate

extension ListCompaniesTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
        
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! EmpresasCelulaTableViewCell
=======
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! CompaniesCell
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
        let company = companies[indexPath.row]
        let urlImage = company.photo ?? ""
        let imageURL = "\(APIRequest.Constants.baseURL)\(urlImage)"
        let defaultImage = UIImage(named: "imgEmpresaDefault")
        
        if urlImage == "<null>" {
            reusableCell.imageView?.image = #imageLiteral(resourceName: "imgEmpresaDefault")
        }
        else {
            reusableCell.imageView?.kf.indicatorType = .activity
            reusableCell.imageView?.kf.setImage(with: URL(string: imageURL), placeholder: defaultImage, options: [.transition(.fade(0.5))], progressBlock: nil)
        }
        
        reusableCell.nomeEmpresaLabel.text = company.enterprise_name
        reusableCell.descricaoEmpresaLabel.text = company.enterprise_type_name
        reusableCell.locationEmpresaLabel.text = company.country

        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToCompanyDetail(to: companies[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: -UISearchBarDelegate

<<<<<<< HEAD:Empresas Ios/VIews/Enterprises/ListarEmpresasTableViewController.swift
    extension ListarEmpresasTableViewController: UISearchBarDelegate {
        //Cancel button
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.coordinator?.companyList()
            self.navigationItem.searchController = nil
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
=======
extension ListCompaniesTableView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        coordinator?.coordinateToCancelSearch()
        navigationItem.searchController = nil
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
>>>>>>> develop:Empresas Ios/Views/List of Companies/ListCompaniesTableView.swift
    }
}
