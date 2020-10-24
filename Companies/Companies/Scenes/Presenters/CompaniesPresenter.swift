//
//  CompaniesPresenter.swift
//  Companies
//
//  Created by Daniel Gx on 19/08/20.
//  Copyright © 2020 Daniel Gx. All rights reserved.
//

import Foundation
import Moya

protocol CompaniesViewable: AnyObject {
    func customizeNavigationController()
    func setupAnimation()
    func customizeTableView()
    func alert(withTitle title: String, andMessage message: String)
    func reloadData()
    func parseCompanies(_ response: Enterprises?)
    func setupTableView()
    func searchTapped()
    func cancelTapped()
}

protocol CompaniesSceneCoordinating {
    func showCompanyDetail(company: Companies)
}

protocol CompaniesPresentable {
    var view: CompaniesViewable? { get }
    var coordinator: CompaniesSceneCoordinating? { get }
}


class CompaniesPresenter: CompaniesPresentable {
    internal weak var view: CompaniesViewable?
    internal var coordinator: CompaniesSceneCoordinating?
    
    
    // MARK: - Properties
    static var possible: Bool?
    
    
    required public init(withCoordinator coordinator: CompaniesSceneCoordinating) {
        self.coordinator = coordinator
    }
    
    func attach(_ view: CompaniesViewable) {
        self.view = view
    }
}


// MARK: - Presenting
extension CompaniesPresenter: CompaniesPresenting, GetCompanies {
    func isPossible() -> Bool {
        if CompaniesPresenter.possible == nil {
            return true
        }
        return false
    }
    
    public func getEnterprises(withTarget target: TargetType) {
        getCompanies(target: target) { [weak self] (response, error) in
            guard let self = self else { return }
            guard error != nil else {
                self.view?.parseCompanies(response)
                CompaniesPresenter.possible = true
                self.view?.reloadData()
                return
            }
            self.view?.alert(withTitle: "Warning", andMessage: error ?? "Unknown")
        }
    }
    
    func selectCompany(_ company: Companies) {
        coordinator?.showCompanyDetail(company: company)
    }
}
