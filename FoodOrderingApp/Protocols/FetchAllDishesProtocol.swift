//
//  FetchAllDishesProtocol.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation
protocol FetchAllDishesProtocol {
    
    func getAllDishes(completion :  @escaping ((AllDishes? , Error?) ->Void)) -> Void

}
