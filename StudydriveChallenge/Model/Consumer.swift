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
        consumeTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { [weak self] (t) in
            guard let self = self else { return }
            self.delegate?.consumeProduct()
        })
        consumeTimer?.fire()
    }
    
    func stopConsuming(){
        consumeTimer?.invalidate()
    }
    
    
    
}
