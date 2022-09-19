//
//  DishDetailViewController.swift
//  uzma
//
//  Created by misho zirakashvili on 12.09.22.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formatedCalories
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("please endet youre name")
            
            return
        }
        ProgressHUD.show("placing order")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self] (result) in
            switch result {
                
            case .success(_):
                ProgressHUD.showSucceed("your order has been received. 🧑‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    


}
