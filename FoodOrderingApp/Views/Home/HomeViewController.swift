//
//  HomeViewController.swift
//  FoodOrderingApp
//
//  Created by mac on 24/08/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    static let identifier = String(describing: HomeViewController.self)
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var category : [DishCategory] = []
    var popular : [Dish] = []
    var special : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        ProgressHUD.show()
        setupProgressHudUi()
        fetchAllDishes()
        print("test")
        
        
    }
    
    private func fetchAllDishes(){
        ApiServices.shared.getAllDishes(url: "\(Route.baseUrl)/dish-categories") {[weak self] data, error in
            if let error = error {
                print(error)
            }else{
                if let response = data {
                    //  print(response)
                    ProgressHUD.dismiss()
                    self?.category = response.data?.categories ?? []
                    self?.popular = response.data?.populars ?? []
                    self?.special = response.data?.specials ?? []
                    
                    DispatchQueue.main.async {
                        
                        
                        [self?.categoryCollectionView , self?.popularCollectionView,self?.specialCollectionView].forEach { collection  in
                            collection?.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
    
    private func setupProgressHudUi(){
        ProgressHUD.colorAnimation = .red
        ProgressHUD.animationType = .horizontalCirclesPulse
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularsCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
        
        
    }
    
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView :
            return category.count
        case popularCollectionView :
            return popular.count
        case specialCollectionView :
            return special.count
        default :
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setupCell(category: category[indexPath.row])
            return cell
            
        case popularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularsCollectionViewCell.identifier, for: indexPath) as! PopularsCollectionViewCell
            
            cell.setupCell(popularDish: popular[indexPath.row])
            return cell
            
        case specialCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            
            cell.setUpCell(dish: special[indexPath.row])
            return cell
            
            
        default :
            return UICollectionViewCell()
        }
        
        
    }
    
}

extension HomeViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: DishListViewController.identifier) as! DishListViewController
            controller.category = category[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: DishDetailsViewController.identifier) as! DishDetailsViewController
            
            controller.dish = collectionView == popularCollectionView ? popular[indexPath.row] : special[indexPath.row]
            
            
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}

extension UIViewController{
    
    var contents : UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }else{
            return self
        }
        
    }
    
}

