//
//  LoginResponse.swift
//  Domain
//
//  Created by Daniel Gomes on 03/11/20.
//

import Foundation

public struct AuthenticationResponse: Codable {
    
    var investor: Investor
    var successfully: Bool
    
    public init(investor: Investor, successfully: Bool) {
        
        self.investor = investor
        self.successfully = successfully
    }
    
    enum CodingKeys: String, CodingKey {
        
        case investor
        case successfully = "success"
    }
}

public struct Investor: Codable {
    
    var investorName: String
    var email: String?
    var city: String?
    var balance: Double?
    var photo: String?
    var portfolio: Portfolio?
    var portfolioValue: Double?
    var firstAccess: Bool
    var superAngel: Bool?
    
    public init(investorName: String,
                email: String?,
                city: String?,
                photo: String?,
                portfolio: Portfolio?,
                portfolioValue: Double?,
                firstAccess: Bool,
                superAngel: Bool) {
        
        self.investorName = investorName
        self.email = email
        self.city = city
        self.photo = photo
        self.portfolio = portfolio
        self.portfolioValue = portfolioValue
        self.firstAccess = firstAccess
        self.superAngel = superAngel
    }
    
    enum CodingKeys: String, CodingKey {
        
        case email, city, balance, photo, portfolio
        case investorName = "investor_name"
        case portfolioValue = "portfolio_value"
        case firstAccess = "first_access"
        case superAngel = "super_angel"
    }
}

public struct Portfolio: Codable {
    #warning("TODO: Enterprises array of Companies, not String")
    var enterpriseNumber: Int?
    var enterprises: [String]?
    
    public init(enterpriseNumber: Int?, enterprises: [String]?) {
        
        self.enterpriseNumber = enterpriseNumber
        self.enterprises = enterprises
    }
    
    enum CodingKeys: String, CodingKey {
        
        case enterprises
        case enterpriseNumber = "enterprise_number"
    }
}

// MARK: - Fakes
extension AuthenticationResponse {
    
    static func generateFake() -> AuthenticationResponse {
        let investor = Investor.generateFake()
        return AuthenticationResponse(investor: investor,
                               successfully: true)
    }
}

extension Investor {
    
    static func generateFake() -> Investor {
        let portfolio = Portfolio.generateFake()
        return Investor(investorName: "test",
                 email: "test@gmail.com",
                 city: "BH",
                 photo: "photo.com.br",
                 portfolio: portfolio,
                 portfolioValue: 1000.0,
                 firstAccess: true,
                 superAngel: true)
    }
}

extension Portfolio {
    
    static func generateFake() -> Portfolio {
        Portfolio(enterpriseNumber: 1,
                  enterprises: ["1", "2", "3"])
    }
}
