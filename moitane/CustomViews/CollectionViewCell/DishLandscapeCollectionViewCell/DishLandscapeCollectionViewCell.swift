//
//  DishLandscapeCollectionViewCell.swift
//  uzma
//
//  Created by misho zirakashvili on 12.09.22.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static var identifier = String(describing: DishLandscapeCollectionViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setUp(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formatedCalories
    }
}
