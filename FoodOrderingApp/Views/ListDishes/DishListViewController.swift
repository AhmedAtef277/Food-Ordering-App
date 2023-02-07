//
//  ListDishesViewController.swift
//  FoodOrderingApp
//
//  Created by mac on 30/08/2022.
//

import UIKit
import ProgressHUD

class DishListViewController: UIViewController {
    static let identifier = String(describing: DishListViewController.self)
    var category : DishCategory!
    var dishesServices : DishesRepositories!
    
    @IBOutlet private weak var listDishesTableView: UITableView!
    var dishesList : [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dishesServices = DishesRepositories()
        title = category.title
        register()
        fetchCategoriesDishes()
    }
    
    private func register(){
        listDishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    private func fetchCategoriesDishes(){
        ProgressHUD.show()
        dishesServices.fetchCategoriesDishes(categoryId: category.id ?? "") { [weak self] dishes, error in
            self?.dishesList = dishes?.data ?? []
            ProgressHUD.dismiss()
            
            DispatchQueue.main.async {
                self?.listDishesTableView.reloadData()
            }
        }
    }
    
}


extension DishListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setupCell(dish: dishesList[indexPath.row])
        return cell
    }
    
    
}
extension DishListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: DishDetailsViewController.identifier) as! DishDetailsViewController
        controller.dish = dishesList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
