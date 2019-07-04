//
//  InfoLabel.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation
import UIKit


class InfoLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp(){
        font = FontsTheme.labelFont
        
        basicSetUp()
        setUpText(0, 0, 0)
    }
    
    func setUpText(_ productsCount: Int, _ producersCount: Int, _ consumersCount: Int){
        let productsC = String(format: "%003d", productsCount)
        let producerC = String(format: "%003d", producersCount)
        let consumerC = String(format: "%003d", consumersCount)
        text = "Producers: \(producerC); Consumers: \(consumerC); Products: \(productsC)"
    }
    

}
