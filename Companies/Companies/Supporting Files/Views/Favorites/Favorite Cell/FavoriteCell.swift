//
//  FavoriteCell.swift
//  Empresas Ios
//
//  Created by Daniel Gx on 13/04/20.
//  Copyright © 2020 danielgomes. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    // MARK: - Properties
    
    var cellTitle: String?
    var cellDescription: String?
    var cellImage: UIImage?
    
    var cellTitleView: UITextView = {
        let cellTitleView = UITextView()
        cellTitleView.translatesAutoresizingMaskIntoConstraints = false
        cellTitleView.isEditable = false
        cellTitleView.isSelectable = false
        return cellTitleView
    }()
    
    var celldescriptionView: UITextView = {
        let cellDescriptionView = UITextView()
        cellDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        cellDescriptionView.isEditable = false
        cellDescriptionView.isSelectable = false
        return cellDescriptionView
    }()
    
    var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        return cellImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(cellTitleView)
        self.addSubview(celldescriptionView)
        self.addSubview(cellImageView)
        
        cellImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cellImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        cellTitleView.leftAnchor.constraint(equalTo: self.cellImageView.rightAnchor).isActive = true
        cellTitleView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        cellTitleView.bottomAnchor.constraint(equalTo: self.celldescriptionView.topAnchor).isActive = true
        cellTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellTitleView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        cellTitleView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        celldescriptionView.leftAnchor.constraint(equalTo: self.cellImageView.rightAnchor).isActive = true
        celldescriptionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        celldescriptionView.topAnchor.constraint(equalTo: self.cellTitleView.bottomAnchor).isActive = true
        celldescriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let cellTitle = cellTitle {
            cellTitleView.text = cellTitle
        }
        if let cellDescription = cellDescription {
            celldescriptionView.text = cellDescription
        }
        if let cellImage = cellImage {
            cellImageView.image = cellImage
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
