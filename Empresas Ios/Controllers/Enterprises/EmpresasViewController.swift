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
        var empresas: [Empresas] = []
        let searchBar = UISearchBar()
        var searchButton: UIBarButtonItem?
        
        
        //MARK: -Life cycle
    
        override func viewDidLoad() {
            super.viewDidLoad()
           
            searchBar.delegate = self as? UISearchBarDelegate
            searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(EmpresasViewController.addTapped(_:)))
            let bgColorNavigation = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
            UINavigationBar.appearance().barTintColor = bgColorNavigation
            UINavigationBar.appearance().tintColor = .white
            self.setUpNavBar()
            
        }
        
        //MARK: -Funcs
    
        @objc func addTapped(_ sender:UIBarButtonItem!){
            
            self.navigationItem.rightBarButtonItem = nil
            self.navigationItem.titleView?.isHidden = true
            //self.setUpSeachBar()
            self.navigationItem.rightBarButtonItem = nil
            self.coodinator?.tableViewList()
            
        }
    
            func setUpNavBar(){
                
                self.navigationController?.setNavigationBarHidden(false, animated: true)
                self.navigationItem.hidesBackButton = true
                self.navigationController?.navigationBar.prefersLargeTitles = false
                self.navigationItem.hidesSearchBarWhenScrolling = false
                self.navigationItem.rightBarButtonItem = searchButton
                self.navigationItem.titleView = UIImageView(image: UIImage(named: "logoIcon"))
                
            }
    
        private func addNavBarImage() {
            
            let image = UIImage(named: "logoHome.png")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 136, y: 30, width: 102.7, height: 25)
            imageView.contentMode = .scaleAspectFit
            self.navigationItem.titleView = imageView
            
    }
}
