//
//  HomeViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit
import SVProgressHUD
import Loaf

class HomeViewController: UIViewController {

    @IBOutlet weak var recipeOfTheDayView: UIView!
    @IBOutlet weak var imgRecipeOfTheDay: UIImageView!
    @IBOutlet weak var lblRecipeOfTheDay: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var recipeImageArray = ["https://homepages.cae.wisc.edu/~ece533/images/fruits.png", "https://homepages.cae.wisc.edu/~ece533/images/airplane.png", "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png", "https://homepages.cae.wisc.edu/~ece533/images/boat.png", "https://homepages.cae.wisc.edu/~ece533/images/mountain.png", "https://homepages.cae.wisc.edu/~ece533/images/mountain.png"]
    
    var  recipeNameArray = ["Fruit","Airplane","Arctichare","Boat","Cae","Mountain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        DispatchQueue.main.async {
//            SVProgressHUD.show(withStatus: "Loading...")
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            //SVProgressHUD.dismiss()
//            SVProgressHUD.showError(withStatus: "Loading end")
//            
//            Loaf("This is a testing error", state: .error, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show(.custom(5)) { (action) in
//                
//            }
//        }
        
    }
    
    func setupViews(){
        imgRecipeOfTheDay.roundCorners(radius: 20)
        lblRecipeOfTheDay.text = "Recipe\nof the day"
        
        let cellNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(cellNib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (categoryCollectionView.frame.width / 2) - 40, height: categoryCollectionView.frame.height - 40)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        categoryCollectionView.collectionViewLayout = layout 
    }
    
    @IBAction func btnArrowTapped(_ sender: UIButton) {
        
    }
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.imgCategory.roundCorners(radius: 20)
        //cell.imgCategory.sd_setImage(with: URL(string: recipeImageArray[indexPath.row]), placeholderImage: UIImage(named: "https://homepages.cae.wisc.edu/~ece533/images/watch.png"))
        //cell.lblCategory.text = recipeNameArray[indexPath.row]
        cell.imgCategory.image = UIImage(named: indexPath.row % 2 == 0 ? "Recipe6" : "Recipe7")
        cell.lblCategory.text = indexPath.row % 2 == 0 ? "Sandwich with smoked ham" : "Brownie with almonds and melted chocolate"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
