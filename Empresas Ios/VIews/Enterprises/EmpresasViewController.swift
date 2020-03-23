//
//  EmpresasViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 11/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class EmpresasViewController: UIViewController, Storyboarded {
    
        //MARK: -Variables
    
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
}
