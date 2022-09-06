//
//  PopularsCollectionViewCell.swift
//  FoodOrderingApp
//
//  Created by mac on 27/08/2022.
//

import UIKit
import Kingfisher

class PopularsCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "PopularsCollectionViewCell"

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
    
    func setupCell(popularDish : Dish){
        
        title.text = popularDish.name
        dishImageView.kf.setImage(with: URL(string: popularDish.image ?? ""))
        caloriesLabel.text = "\(popularDish.calories) Calories"
        dishImageView.kf.indicatorType = .activity
        (dishImageView.kf.indicator?.view as? UIActivityIndicatorView)?.color = .red
        descriptionLabel.text = popularDish.description
        
    }
    
}
