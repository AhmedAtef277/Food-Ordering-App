//
//  UIViewController + Extension.swift
//  FoodOrderingApp
//
//  Created by Ahmed Atef on 16/06/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    var contents : UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        }else{
            return self
        }
        
    }
    
}
