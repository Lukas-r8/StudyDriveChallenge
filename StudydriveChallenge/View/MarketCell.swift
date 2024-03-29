//
//  MarketCell.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation
import UIKit


class MarketCell: UITableViewCell {
    // Setting up Data for cell...
    var product: Product? {
        didSet {
            guard let product = product else {return}
            IDLabel.text = String(product.producerId)
            productNameLabel.text = product.productName
            productImage.image = UIImage(named: product.productName)
        }
    }
    
    // Setting up views...
    private var containerView: UIView = {
        let container = UIView()
        container.addShadow()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.white
        container.layer.cornerRadius = 15
        return container
    }()
    
    
    private var producerLabel: UILabel = {
        let label = UILabel()
        label.basicSetUp("Producer ID:")
        label.font = FontsTheme.labelFont
        return label
    }()
    
    private var IDLabel: UILabel = {
        let label = UILabel()
        label.basicSetUp()
        label.font = FontsTheme.infoFont
        return label
    }()
    
    private var separator: UIView = {
        let viewSeparator = UIView()
        viewSeparator.backgroundColor = UIColor.gray
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false
        viewSeparator.layer.cornerRadius = 0.5
        return viewSeparator
    }()
    
    private var productLabel: UILabel = {
        let label = UILabel()
        label.basicSetUp("Product:")
        label.font = FontsTheme.labelFont
        return label
    }()

    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.basicSetUp()
        label.font = FontsTheme.infoFont
        return label
    }()
    
    private var productImage: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.contentMode = .scaleAspectFill
        imgview.clipsToBounds = true
        imgview.layer.cornerRadius = 20
        return imgview
    }()
    
    
    
    // initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        SetUpViewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SetUpViewsAndConstraints()
    }
    
    
    
    // setting up constraints for view and adding them to superview....
    private func SetUpViewsAndConstraints(){
        selectionStyle = .none
        addSubview(containerView)
        containerView.addMultipleSubViews(producerLabel, IDLabel, separator, productLabel, productNameLabel, productImage)
        
        let spacing: CGFloat = 7
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        
        producerLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: spacing).isActive = true
        producerLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        producerLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.32).isActive = true
        producerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        IDLabel.centerXAnchor.constraint(equalTo: producerLabel.centerXAnchor).isActive = true
        IDLabel.topAnchor.constraint(equalTo: producerLabel.bottomAnchor, constant: spacing).isActive = true
        IDLabel.widthAnchor.constraint(equalTo: producerLabel.widthAnchor).isActive = true
        IDLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -spacing).isActive = true
        
        separator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        separator.leftAnchor.constraint(equalTo: producerLabel.rightAnchor, constant: spacing).isActive = true
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.7).isActive = true
        
        productLabel.topAnchor.constraint(equalTo: producerLabel.topAnchor).isActive = true
        productLabel.leftAnchor.constraint(equalTo: separator.rightAnchor).isActive = true
        productLabel.rightAnchor.constraint(equalTo: productImage.leftAnchor).isActive = true
        productLabel.heightAnchor.constraint(equalTo: producerLabel.heightAnchor).isActive = true
        
        productNameLabel.centerXAnchor.constraint(equalTo: productLabel.centerXAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: spacing).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: productLabel.widthAnchor).isActive = true
        productNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -spacing).isActive = true
        
        productImage.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        productImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        productImage.widthAnchor.constraint(equalTo: productImage.heightAnchor).isActive = true
    }

}
