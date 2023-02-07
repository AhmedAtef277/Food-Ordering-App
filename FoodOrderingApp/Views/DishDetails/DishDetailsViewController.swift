//
//  DishDetailsViewController.swift
//  FoodOrderingApp
//
//  Created by mac on 28/08/2022.
//

import UIKit
import Kingfisher
import ProgressHUD


class DishDetailsViewController: UIViewController {
    
    static let identifier = String(describing: DishDetailsViewController.self)
    
    @IBOutlet private weak var placeOrderOutlet: UIButton!
    
    
    @IBOutlet private weak var dishImage: UIImageView!
    @IBOutlet private weak var dishTitle: UILabel!
    
    @IBOutlet private weak var dishCalories: UILabel!
    
    @IBOutlet private weak var dishDescription: UILabel!
    
    @IBOutlet private weak var nameField: UITextField!
    
    var dish : Dish!
    var placeOrderServices : PlaceOrderRepository!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        placeOrderServices = PlaceOrderRepository()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        dishImage.kf.setImage(with: URL(string: dish.image ?? ""))
        dishTitle.text = dish.name
        dishCalories.text = "\(dish.calories) Calories"
        dishDescription.text = dish.description
    }
    @IBAction private func placeOrder(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces) , !name.isEmpty else{
            ProgressHUD.showError("It is not available name")
            return
        }
        ProgressHUD.show()
        placeOrder()
        placeOrderOutlet.isEnabled = false
        
        
        
    }
    func placeOrder(){
        placeOrderServices.palceOrder(orderId: dish?.id ?? "" , name: nameField.text!) { data, error in
           // print("data is \(data)")
            if data?.status == 201{
                ProgressHUD.showSucceed(data?.message)
                
                self.navigationController?.popViewController(animated: true)
            }else{
                ProgressHUD.showError(data?.message ?? "Can't palce order now")
                
            }
        }
    }
}
