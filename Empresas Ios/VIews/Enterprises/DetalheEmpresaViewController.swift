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
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    
    //MARK: -Variables

    lazy var detailCompanyPresenter = DetailCompanyViewPresenter(with: self)
    var selectEnterprise: Companies!
    var photoString: String?
    var backButton: UIBarButtonItem?
    weak var coordinator: MainCoordinator?

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setOutlets()
    }
    
    // MARK: - Funcs
    
    @objc func backTapped(_ sender:UIBarButtonItem!) {
        self.coordinator?.tableViewList()
    }
}

// MARK: - Extensions

extension DetalheEmpresaViewController: DetailCompanyPresenter {
    
    func setOutlets() {
        companyDescriptionLabel.text = selectEnterprise.description
        let urlPhoto = selectEnterprise.photo
        if urlPhoto != nil {
            self.companyImageView.image = #imageLiteral(resourceName: "imgEmpresaDefault")
        } else {
            let url = URL(string: "https://empresas.ioasys.com.br"+urlPhoto!)
            self.companyImageView.kf.setImage(with: url)
        }
    }
    
    func setNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.navigationItem.title = selectEnterprise.enterprise_name
        self.navigationItem.hidesBackButton = true
        backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .done, target: self, action: #selector(DetalheEmpresaViewController.backTapped(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
}
