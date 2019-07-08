//
//  Producer.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation


class Producer {
    
    var producerID: Int
    private var productsName = ["Chocolate","Meat","Drink","Flower","Pencil"]
    private var productionTimer: Timer?
    
    weak var delegate: MarketManagerDelegate?
    
    init(producerID: Int) {
        self.producerID = producerID
  
    }
    
    func startProduction(){
        productionTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { [weak self] (t) in
            guard let self = self else { return }
            let output = Product(producerId: self.producerID, productName: self.productsName.randomElement() ?? "None")
            self.delegate?.produceProduct(output)
        })
        productionTimer?.fire()
    }
    
    
    func stopProduction(){
        productionTimer?.invalidate()
    }
    
    deinit {
        print("DEINIT PRODUCER:", producerID)
    }
}
