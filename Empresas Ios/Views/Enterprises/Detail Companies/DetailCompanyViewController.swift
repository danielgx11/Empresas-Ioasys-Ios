//
//  DetalheEmpresaViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 19/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCompanyViewController: UIViewController, Storyboarded {
        
    //MARK: -Outlets
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    
    //MARK: -Variables

    lazy var detailCompanyPresenter = DetailCompanyViewPresenter(with: self)
    var selectEnterprise: Companies!
    var photoString: String?
    var backButton: UIBarButtonItem?
    weak var coordinator: DetailCompaniesCoordinator?

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setOutlets()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coordinator?.didFinishDetailCompanies()
    }
    
    // MARK: - Funcs
    
    @objc func backTapped(_ sender:UIBarButtonItem!) {
        self.coordinator?.parentCoordinator?.tableViewList()
    }
}

// MARK: - Extensions

extension DetailCompanyViewController: DetailCompanyPresenter {
    
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
        backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "backButton"), style: .done, target: self, action: #selector(DetailCompanyViewController.backTapped(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
}
