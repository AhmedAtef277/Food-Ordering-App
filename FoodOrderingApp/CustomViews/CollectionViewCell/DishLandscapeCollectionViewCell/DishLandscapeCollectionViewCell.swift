//
//  DishLandscapeCollectionViewCell.swift
//  FoodOrderingApp
//
//  Created by mac on 28/08/2022.
//

import UIKit
import Kingfisher
class DishLandscapeCollectionViewCell: UICollectionViewCell {

    
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!

    
    func setUpCell(dish : Dish){
        dishTitle.text = dish.name
        dishImageView.kf.setImage(with: URL(string: dish.image ?? ""))
        calories.text = "\(dish.calories) Calories"
        dishImageView.kf.indicatorType = .activity
        dishDescription.text = dish.description
        

    }
    
}
