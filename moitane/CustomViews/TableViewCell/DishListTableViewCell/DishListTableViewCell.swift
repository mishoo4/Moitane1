//
//  DishListTableViewCell.swift
//  uzma
//
//  Created by misho zirakashvili on 14.09.22.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifier = "DishListTableViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var dishTitleLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish? .image?.asUrl)
        dishTitleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
}
