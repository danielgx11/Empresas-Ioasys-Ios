//
//  ListarEmpresasTableViewController.swift
//  Empresas Ios
//
//  Created by Daniel G on 14/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class ListarEmpresasTableViewController: UIViewController, Storyboarded {
    //MARK: -Variables
    weak var coordinator: MainCoordinator?
    var empresas = [Empresas]()
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    
    
    private func empresasRequest() {
        EmpresasAPI.getCompanies { (response, error, cache) in
            if response != nil {
                self.empresas = response ?? []
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let company = empresas[indexPath.row]
        cell.textLabel?.text = company.enterpriseName
        return cell
    }
}
