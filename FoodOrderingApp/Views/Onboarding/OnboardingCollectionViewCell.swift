//
//  OnboardingCollectionViewCell.swift
//  FoodOrderingApp
//
//  Created by mac on 24/08/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet private weak var slideImageView: UIImageView!
    @IBOutlet private weak var slideTitle: UILabel!
    @IBOutlet private weak var slideDescreption: UILabel!
    
    
    
    func setUpCell(slide : OnboardingSlide){
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescreption.text = slide.descreption
    }
}
