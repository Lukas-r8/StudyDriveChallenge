//
//  MarketManagerDelegateFunctions.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation
import UIKit

extension MarketViewController: MarketManagerDelegate {
    
    // market manager delegate functions....
    func consumeProduct() {
        if products.count != 0 {
            products = Array(products.dropFirst(1))
            let indexPath = IndexPath(row: 0, section: 0)
            marketTableView.beginUpdates()
            marketTableView.deleteRows(at: [indexPath], with: .right)
            marketTableView.endUpdates()
        }
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
    
    func produceProduct(_ product: Product) {
        products.append(product)
        let indexPath = IndexPath(row: products.count - 1, section: 0)
        marketTableView.beginUpdates()
        marketTableView.insertRows(at: [indexPath], with: .left)
        marketTableView.endUpdates()
        infoLabel.setUpText(products.count, producers.count, consumers.count)
    }
    
}
