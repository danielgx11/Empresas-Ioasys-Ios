//
//  ListarEmpresasTableViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit
import Kingfisher

class ListarEmpresasTableViewController: UIViewController, Storyboarded {
    
    //MARK: -Outlets
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: -Variables
    
    weak var coordinator: MainCoordinator?
    let searchBar = UISearchBar()
    var cancelButton: UIBarButtonItem?
    var companies: [Empresas] = []{
        didSet {
            self.tableView.reloadData()
        }
    }
    
    //MARK: -Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
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
            
            EmpresasAPI.getCompanies(enterprise_name: searchBar.text!){ (response, error, cache) in
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
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.white
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        
    }
    
    func setUpSeachBar(){
        
        searchBar.searchTextField.backgroundColor = .white
        searchBar.text = ""
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Pesquisar"
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.white
        searchBar.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        searchBar.becomeFirstResponder()
        self.navigationItem.titleView = searchBar
        
        }
    
    //Ocult SearchBar
    private func hideSearchBar() {
        self.navigationItem.titleView = nil // Remove a searchBar da navigation
        self.searchBar.resignFirstResponder() // Esconde o teclado
        self.coordinator?.start()
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

extension ListarEmpresasTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! EmpresasCelulaTableViewCell
        let company = companies[indexPath.row]
        let urlImage = company.photo ?? ""
        let imageURL = "\(APIRequest.Constants.baseURL)\(urlImage)"
        let defaultImage = UIImage(named: "imgEmpresaDefault")
        
        //Caso a URL da imagem da empresa seja nula
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
        coordinator?.empresasDescricoes(to: companies[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: -UISearchBarDelegate

    extension ListarEmpresasTableViewController: UISearchBarDelegate {
        //Cancel button
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.coordinator?.empresasLista()
            self.navigationItem.searchController = nil
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
    }
}
