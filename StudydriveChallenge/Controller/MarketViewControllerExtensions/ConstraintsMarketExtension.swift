//
//  ConstraintsMarketExtension.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation
import UIKit

extension MarketViewController {
    
    
    func setUpViewAndConstraints(){
        view.addMultipleSubViews(infoLabel,marketTableView,createProducerButton,createConsumerButton)
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        createProducerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        createProducerButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        createProducerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        createProducerButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        createConsumerButton.bottomAnchor.constraint(equalTo: createProducerButton.bottomAnchor).isActive = true
        createConsumerButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        createConsumerButton.leftAnchor.constraint(equalTo: createProducerButton.rightAnchor).isActive = true
        createConsumerButton.heightAnchor.constraint(equalTo: createProducerButton.heightAnchor).isActive = true
        
        marketTableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor).isActive = true
        marketTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        marketTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        marketTableView.bottomAnchor.constraint(equalTo: createProducerButton.topAnchor).isActive = true
    }
    
    
}
