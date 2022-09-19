//
//  DishPortraitCollectionViewCell.swift
//  uzma
//
//  Created by misho zirakashvili on 11.09.22.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing:DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    func setUp(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formatedCalories
        descriptionLbl.text = dish.description
        
    }
}
