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
    
    @IBOutlet weak var placeOrderOutlet: UIButton!
    
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishTitle: UILabel!
    
    @IBOutlet weak var dishCalories: UILabel!
    
    @IBOutlet weak var dishDescription: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        dishImage.kf.setImage(with: URL(string: dish.image ?? ""))
        dishTitle.text = dish.name
        dishCalories.text = "\(dish.calories) Calories"
        dishDescription.text = dish.description
    }
    @IBAction func placeOrder(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces) , !name.isEmpty else{
            ProgressHUD.showError("It is not available name")
            return
        }
        ProgressHUD.show()
        placeOrder()
        placeOrderOutlet.isEnabled = false
        
        
        
        
        
        
        
    }
    func placeOrder(){
        ApiServices.shared.palceOrder(url: "\(Route.baseUrl)/orders/\(dish?.id ?? "")", name: nameField.text!) { data, error in
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
