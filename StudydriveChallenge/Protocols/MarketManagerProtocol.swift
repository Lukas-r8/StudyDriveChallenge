//
//  MarketManagerProtocol.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation

protocol MarketManagerDelegate: class {
    func consumeProduct()
    func produceProduct(_ output: Product)
}
