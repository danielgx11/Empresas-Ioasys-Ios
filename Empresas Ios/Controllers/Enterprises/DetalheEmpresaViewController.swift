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
    
    weak var coordinator: MainCoordinator?
    

    //MARK: -Outlets
    @IBOutlet weak var empresaImageView: UIImageView!
    @IBOutlet weak var descricaoEmpresaLabel: UILabel!
    
    var selectEnterprise: Empresas!
    var photoString: String?
    var backButton: UIBarButtonItem?

    //MARK: -Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = selectEnterprise.enterprise_name
        self.navigationItem.hidesBackButton = true
        backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .done, target: self, action: #selector(DetalheEmpresaViewController.addTapped(_:)))
        self.navigationItem.leftBarButtonItem = backButton
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
    
    @objc func addTapped(_ sender:UIBarButtonItem!){
        self.coordinator?.tableViewList()
        
    }
    
}
