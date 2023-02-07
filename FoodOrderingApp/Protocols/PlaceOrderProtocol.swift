//
//  DishDetailsProtocol.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation

protocol PlaceOrderProtocol {
    
    func palceOrder(orderId : String, name : String , completion : @escaping ((PlaceOrderResponse? , Error?)->Void))
    
}
