//
//  DetalheEmpresaViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 19/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit
import Kingfisher

class DetailCompanyViewController: UIViewController, StoryboardInitializable {
        
    //MARK: -Outlets
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    
    //MARK: -Variables

    lazy var detailCompanyPresenter = DetailCompanyViewPresenter(with: self)
    var selectEnterprise: Companies!
    var photoString: String?
    var backButton: UIBarButtonItem?
    var coordinator: DetailCompaniesFlow?

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        setOutlets()
    }
    
    // MARK: - Methods
    
    func isPossible(_ company: Companies) -> Bool{
    if FavoriteItems.sharedInstance.array.contains(where: {$0.enterprise_name == company.enterprise_name}) {
            return false
        } else {
            return true
        }
    }
    
    @objc func favoriteTapped() {
        if isPossible(selectEnterprise) {
            FavoriteItems.sharedInstance.array.insert(selectEnterprise, at: 0)
        } else {
            let ac = UIAlertController(title: "Warning", message: "This item is already favorite!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }
    
    @objc func backTapped(_ sender:UIBarButtonItem!) {
        coordinator?.dismissDetailCompanies()
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
        navigationItem.leftBarButtonItem = backButton
        let saveButton = UIBarButtonItem(image: UIImage(named: "star"), style: .done, target: self, action: #selector(favoriteTapped))
        saveButton.tintColor = .white
        navigationItem.rightBarButtonItem = saveButton
    }
}
