//
//  Extention.swift
//  FoodOrderingApp
//
//  Created by mac on 24/08/2022.
//

import UIKit
extension UIView{
   @IBInspectable var cornerRadius : CGFloat {
        get{
           return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
