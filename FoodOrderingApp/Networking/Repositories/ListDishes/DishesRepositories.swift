//
//  DishesRepositories.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation


class DishesRepositories : ListDishesProtocol{
    func fetchCategoriesDishes(categoryId : String , completion : @escaping ((CategoriesDishes? , Error?)->Void)){
        let url = "\(Route.baseUrl)/dishes/\(categoryId)"
        ApiServices.shared.createRequest(url: url, method: .get, completion: completion)
        
        
    }
}

