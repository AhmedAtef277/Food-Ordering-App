//
//  DishListTableViewCell.swift
//  FoodOrderingApp
//
//  Created by mac on 30/08/2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = String(describing: DishListTableViewCell.self)
    var dish : Dish!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    
    func setupCell(dish : Dish){
        dishTitle.text = dish.name
        dishImage.kf.setImage(with: URL(string: dish.image ?? ""))
        dishDescription.text = dish.description
    }
    
    func setupCell(order : Orders){
        dishImage.kf.setImage(with: URL(string: order.dish?.image ?? "" ))
        dishTitle.text = order.dish?.name
        dishDescription.text = order.name
    }
    
}
