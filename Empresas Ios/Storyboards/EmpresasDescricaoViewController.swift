//
//  EmpresasDescricaoViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 19/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class EmpresasDescricaoViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var empresaImageView: UIImageView!
    @IBOutlet weak var descricaoEmpresaImageView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchController = EmpresasViewController()
        searchController.setUpNavBar()
        searchController.setUpSeachBar()
        let bgColorNavigation = UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = bgColorNavigation
        UINavigationBar.appearance().tintColor = .white
    }

}
