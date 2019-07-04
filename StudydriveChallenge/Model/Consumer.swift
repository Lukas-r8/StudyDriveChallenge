//
//  Consumer.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation


class Consumer {
    
    weak var delegate: MarketManagerDelegate?
    private var consumeTimer: Timer?
    
    init() {
        
    }
    
    func startConsuming(){
        consumeTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { (t) in
            self.delegate?.consumeProduct()
        })
        consumeTimer?.fire()
    }
    
    func stopConsuming(){
        consumeTimer?.invalidate()
    }
    
    
    
}
