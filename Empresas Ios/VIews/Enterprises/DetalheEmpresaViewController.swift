//
//  DetalheEmpresaViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 19/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit
import Kingfisher

class DetalheEmpresaViewController: UIViewController, Storyboarded {
        
    //MARK: -Outlets
    @IBOutlet weak var empresaImageView: UIImageView!
    @IBOutlet weak var descricaoEmpresaLabel: UILabel!
    
    //MARK: -Variables

    var selectEnterprise: Companies!
    var photoString: String?
    var backButton: UIBarButtonItem?
    weak var coordinator: MainCoordinator?

    //MARK: -Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setOutlets()
    }
    
    //MARK: -Funcs
    
    @objc func backTapped(_ sender:UIBarButtonItem!) {
        self.coordinator?.tableViewList()
    }
    
    func setNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.navigationItem.title = selectEnterprise.enterprise_name
        self.navigationItem.hidesBackButton = true
        backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .done, target: self, action: #selector(DetalheEmpresaViewController.backTapped(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setOutlets() {
        descricaoEmpresaLabel.text = selectEnterprise.description
        let urlPhoto = selectEnterprise.photo
        if urlPhoto != nil {
            self.empresaImageView.image = #imageLiteral(resourceName: "imgEmpresaDefault")
        }
        else {
            let url = URL(string: "https://empresas.ioasys.com.br"+urlPhoto!)
            self.empresaImageView.kf.setImage(with: url)
        }
    }
}
