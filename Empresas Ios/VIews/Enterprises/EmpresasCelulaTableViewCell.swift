//
//  EmpresasCelulaTableViewCell.swift
//  Empresas Ios
//
//  Created by Daniel G on 19/12/19.
//  Copyright © 2019 danielgomes. All rights reserved.
//

import UIKit

class EmpresasCelulaTableViewCell: UITableViewCell {
    
    //MARK: -Outlets
    
    @IBOutlet weak var empresaImageView: UIImageView!
    @IBOutlet weak var nomeEmpresaLabel: UILabel!
    @IBOutlet weak var descricaoEmpresaLabel: UILabel!
    @IBOutlet weak var locationEmpresaLabel: UILabel!
    
    //MARK: -Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
