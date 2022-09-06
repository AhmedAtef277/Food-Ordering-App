//
//  OnboardingViewController.swift
//  FoodOrderingApp
//
//  Created by mac on 24/08/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    static let identifier = String(describing: OnboardingViewController.self)
    
    @IBOutlet weak var slideCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides : [OnboardingSlide] = []
    //    var currentPage = 0 {
    //        didSet{
    //            if currentPage == slides.count - 1{
    //                nextButton.setTitle("Get Started", for: .normal)
    //            }else{
    //                nextButton.setTitle("Next", for: .normal)
    //            }
    //        }
    //    }
    var currentPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", descreption: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", descreption: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", descreption: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        
        pageControl.numberOfPages = slides.count
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        
        UserDefaults.standard.set(true, forKey: "hasOnboarded")
        
        present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
}

extension OnboardingViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setUpCell(slide: slides[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        
    }
    
}
