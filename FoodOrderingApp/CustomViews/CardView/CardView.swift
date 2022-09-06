//
//  CardView.swift
//  FoodOrderingApp
//
//  Created by mac on 27/08/2022.
//

import Foundation
import Accelerate
import UIKit
class CardView : UIView{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    private func setView(){
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
    }
}


