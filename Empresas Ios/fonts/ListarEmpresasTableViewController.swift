//
//  ListarEmpresasTableViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class ListarEmpresasTableViewController: UIViewController, Storyboarded {
    
    //MARK: -Outlets
    
    @IBOutlet var tableView: UITableView!
    
    //MARK: -Variables
    
    weak var coordinator: MainCoordinator?
    var empresas = [Empresas]()
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        empresasRequest()
    }
    
    
    private func empresasRequest() {
        EmpresasAPI.getCompanies { (response, error, cache) in
            if response != nil {
                self.empresas = response ?? []
                debugPrint("Success!")
                self.tableView.reloadData()
                //Reload Data
            } else if let error = error {
                
                if let urlResponse = error.urlResponse, urlResponse.statusCode == 401 {
                    // logout user
                } else if let responseObject = error.responseObject as? [String: Any], let errorMessage = responseObject["error_message"] {
                    // show errorMessage
                } else {
                    // show error.originalError.localizedDescription
                }
            }
        }
    }
    
    
    //MARK: -Create IMAGE
    private func createImage(url: URL){
        var imageView = UIImageView(frame: CGRect(x: 100, y: 150, width: 150, height: 150))
        //How to convert URL in String
        var image = UIImage(named: "")
        imageView.image = image
        self.view.addSubview(imageView)
    }
}



// MARK: - Table view data source and delegate

extension ListarEmpresasTableViewController: UITableViewDelegate, UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return empresas.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        let company = empresas[indexPath.row]
        let urlImage = company.photo ?? ""
        let x = "\(APIRequest.Constants.baseURL)\(APIRequest.Constants.apiPath)\(urlImage)"
        let imageURL = URL(fileURLWithPath: x)
        
        reusableCell.imageView?.loadImage(url: imageURL)
        reusableCell.textLabel?.text = company.enterpriseName

        return reusableCell
    }
    
    //TODO: Criar imagem para atribuir url e exibir a imagem
}


extension UIImageView {
    func loadImage(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

