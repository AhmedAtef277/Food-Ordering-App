//
//  CategoryCollectionViewCell.swift
//  FoodOrderingApp
//
//  Created by mac on 27/08/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    func setupCell(category : DishCategory){
        categoryTitle.text = category.title
        categoryImageView.kf.setImage(with: URL(string: category.image ?? ""))
    }
}
