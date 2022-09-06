//
//  OrdersListViewController.swift
//  FoodOrderingApp
//
//  Created by mac on 31/08/2022.
//

import UIKit
import ProgressHUD

class OrdersListViewController: UIViewController {

    @IBOutlet weak var ordersTableView: UITableView!
    
    var orderList : [Orders] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        register()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchOrders()

    }
    
    private func register(){
         ordersTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
     }
    private func fetchOrders(){
        ProgressHUD.show()
        ApiServices.shared.fetchOrders(url:  "\(Route.baseUrl)/orders") { [weak self] orders, error in
            self?.orderList = orders?.data ?? []
            ProgressHUD.dismiss()
            
            DispatchQueue.main.async {
                self?.ordersTableView.reloadData()
            }
        }
    }
    

}

extension OrdersListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        
        cell.setupCell(order: orderList[indexPath.row])
        return cell
        
    }
    
    
}

extension OrdersListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: DishDetailsViewController.identifier) as! DishDetailsViewController
        controller.dish = orderList[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}

