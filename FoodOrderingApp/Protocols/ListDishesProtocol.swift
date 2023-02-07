//
//  OrdersProtocol.swift
//  FoodOrderingApp
//
//  Created by mac on 07/02/2023.
//

import Foundation
 
protocol ListDishesProtocol {
    
    func fetchCategoriesDishes(categoryId : String, completion : @escaping ((CategoriesDishes? , Error?)->Void))
        
       
}
