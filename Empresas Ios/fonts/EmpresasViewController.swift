//
//  EmpresasViewController.swift
//  Empresas Ios
//
//  Created by ioasys on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class EmpresasViewController: UIViewController, Storyboarded {
    
     weak var coodinator: MainCoordinator?

    @IBOutlet weak var containerView: UIView!
    
        var empresas: [Empresas] = []
        let searchController = UISearchBar()
        var searchButton: UIBarButtonItem?
        var cancelButton: UIBarButtonItem?
        
        override func viewDidLoad() {
            super.viewDidLoad()
           
            searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(EmpresasViewController.addTapped(_:)))
            let bgColorNavigation = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
            UINavigationBar.appearance().barTintColor = bgColorNavigation
            UINavigationBar.appearance().tintColor = .white
            containerView.isHidden = true
            self.setUpNavBar()
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            
        }
        
        @objc func addTapped(_ sender:UIBarButtonItem!){
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.titleView?.isHidden = true
            self.setUpSeachBar()
            self.navigationItem.rightBarButtonItem = nil
            containerView.isHidden = false
            
        }
    
        @objc func cancelTapped(_ sender:UIBarButtonItem!){
            self.navigationItem.searchController = nil
            debugPrint("Funcionou")
    }
        
        //MARK: Setup
        func setUpNavBar(){
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationItem.hidesBackButton = true
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationItem.hidesSearchBarWhenScrolling = false
            self.navigationItem.rightBarButtonItem = searchButton
            self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
            
            
        }
        
    //Configure SearchBar
        func setUpSeachBar(){
            let iconClear =  UIImage(named: "clear")

            navigationItem.titleView = searchController
            self.searchController.tintColor = UIColor.white
            self.searchController.barTintColor = UIColor.white
            self.searchController.barStyle = .default
            self.searchController.showsCancelButton = true
            self.cancelButton?.action = #selector(EmpresasViewController.searchBarCancelButtonClicked(_:))
            self.searchController.delegate = self
            self.searchController.placeholder = "Pesquisar"
            self.searchController.image(for: UISearchBar.Icon.clear, state: .normal)
            self.searchController.setImage(iconClear, for: .clear, state: .normal)
            
        }
    
    //Ocult SearchBar
    private func hideSearchBar() {
        self.navigationItem.titleView = nil // Remove a searchBar da navigation
        self.searchController.resignFirstResponder() // Esconde o teclado
        self.navigationItem.rightBarButtonItem = self.searchButton
        self.addNavBarImage()
    }
    
    private func addNavBarImage() {

        let image = UIImage(named: "logoHome.png")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 136, y: 30, width: 102.7, height: 25)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
        
}

//MARK: -UISearchBarDelegate

extension EmpresasViewController: UISearchBarDelegate {
    //Cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.navigationItem.searchController = nil
        self.navigationItem.rightBarButtonItem = searchButton
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
        searchController.showsCancelButton = false
        searchController.endEditing(true)
        containerView.isHidden = true
        
    }
}
