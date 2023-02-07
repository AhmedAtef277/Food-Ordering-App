//
//  OrderRepositories.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation
class OrderRepositories: OrdersProtocol {
    
    func fetchOrders(completion: @escaping(PlacedOrders?, Error?)->Void){
        ApiServices.shared.createRequest(url: "\(Route.baseUrl)/orders", method: .get, completion: completion)
    }
    
}
