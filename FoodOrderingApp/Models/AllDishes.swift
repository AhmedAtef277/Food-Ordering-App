//
//  AllDishes.swift
//  FoodOrderingApp
//
//  Created by mac on 31/08/2022.
//

import Foundation

struct AllDishes : Codable{
    var status : Int?
    var message : String?
    var data : DishDetils?
    
}

struct DishDetils: Codable{
    var categories : [DishCategory]?
    var populars : [Dish]?
    var specials : [Dish]?
}


