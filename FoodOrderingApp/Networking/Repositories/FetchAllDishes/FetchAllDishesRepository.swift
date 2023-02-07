//
//  FetchAllDishesRepository.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation
class FetchAllDishesRepository : FetchAllDishesProtocol{
    
    func getAllDishes(completion :  @escaping ((AllDishes? , Error?) ->Void)) -> Void{
        
        ApiServices.shared.createRequest(url: "\(Route.baseUrl)/dish-categories", method: .get, completion: completion)
        
    }
}
