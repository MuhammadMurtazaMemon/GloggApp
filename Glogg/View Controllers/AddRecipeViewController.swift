//
//  AddRecipeViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var publishRecipeTableView: UITableView!
    var cellNib2: UINib!
    var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        
        let cellNib = UINib(nibName: "PhotoAndVideoTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib, forCellReuseIdentifier: "PhotoAndVideoTableViewCell")
        cellNib2 = UINib(nibName: "PhotosAndVideosCollectionViewCell", bundle: nil)
        let cellNib3 = UINib(nibName: "IngredientsTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib3, forCellReuseIdentifier: "IngredientsTableViewCell")
        let cellNib4 = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib4, forCellReuseIdentifier: "RecipeTableViewCell")
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 166, height: 166)
        
        
    }
}

extension AddRecipeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoAndVideoTableViewCell", for: indexPath) as! PhotoAndVideoTableViewCell
            cell.nameView.layer.cornerRadius = cell.nameView.frame.height / 2
            cell.nameView.layer.borderColor = UIColor.lightGray.cgColor
            cell.nameView.layer.borderWidth = 1
            cell.photoCollectionView.register(cellNib2, forCellWithReuseIdentifier: "PhotosAndVideosCollectionViewCell")
            cell.photoCollectionView.collectionViewLayout = layout
            cell.photoCollectionView.dataSource = self
            cell.photoCollectionView.delegate = self
            return cell
        }
        else if (indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsTableViewCell", for: indexPath) as! IngredientsTableViewCell
            cell.ingredientView.layer.cornerRadius = cell.ingredientView.frame.height / 2
            cell.ingredientView.layer.borderColor = UIColor.lightGray.cgColor
            cell.ingredientView.layer.borderWidth = 1
            
            cell.quantityView.layer.cornerRadius = cell.quantityView.frame.height / 2
            cell.quantityView.layer.borderColor = UIColor.lightGray.cgColor
            cell.quantityView.layer.borderWidth = 1

            cell.btnAdd.isHidden = indexPath.row != 3
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0){
            return 360
        }
        else if (indexPath.row == 1 || indexPath.row == 2){
            return 63
        }
        else if (indexPath.row == 3){
            return 100
        }
        else{
            return 400
        }
    }
}

extension AddRecipeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosAndVideosCollectionViewCell", for: indexPath) as! PhotosAndVideosCollectionViewCell
        cell.btnDelete.isHidden = true
        cell.btnAdd.isHidden = false
        cell.imgMedias.roundCorners(radius: Float(20))
        cell.imgMedias.layer.borderWidth = 1
        cell.imgMedias.layer.borderColor = UIColor.orange.cgColor
        return cell
    }
    
}
