//
//  DishDetailsRepository.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation
class PlaceOrderRepository : PlaceOrderProtocol{
    
    
    
    func palceOrder(orderId : String , name : String , completion : @escaping ((PlaceOrderResponse? , Error?)->Void)){
        
        
        let params = ["name" : name]
        ApiServices.shared.createRequest(url: "\(Route.baseUrl)/orders/\(orderId)", method: .post, completion: completion , parameters: params)


        

        
    }
    
    
}
