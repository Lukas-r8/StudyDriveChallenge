//
//  HelperExtensions.swift
//  StudydriveChallenge
//
//  Created by Lucas Alves Da Silva on 7/4/19.
//  Copyright © 2019 Lucas Alves Da Silva. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func addShadow(_ yoffSet: CGFloat = 2) {
        layer.shadowColor = UIColor.init(white: 0.7, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: yoffSet)
        layer.shadowOpacity = 1
    }
    
    
    func addMultipleSubViews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
    
}


extension UILabel {
    
    func basicSetUp(_ initialText: String? = nil){
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        text = initialText
    }
    
    
    
}
