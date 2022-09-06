//
//  Route.swift
//  FoodOrderingApp
//
//  Created by mac on 31/08/2022.
//

import Foundation
enum Route{
    static let baseUrl = "https://yummie.glitch.me"
    case fetcAllCategories
    case placeOrder(String)
    var description: String {
        switch self {
        case .fetcAllCategories:
            return "/dish-categories"
        case .placeOrder(let id):
            return "/orders/\(id)"
        }
    }
    
}
