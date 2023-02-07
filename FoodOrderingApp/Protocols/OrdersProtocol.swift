//
//  OrdersProtocol.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation

protocol OrdersProtocol {
    
    func fetchOrders(completion : @escaping(PlacedOrders?, Error?)->Void)
}
