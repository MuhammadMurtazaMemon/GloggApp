//
//  SearchViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var txtfieldSearch: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var searchCategoryCollectionView: UICollectionView!
    @IBOutlet weak var categoryItemTableView: UITableView!
    
    var categoryArray = ["Fast Food", "Ice Cream", "Cakes", "Fast Food", "Cakes", "Ice Cream"]
    var selectedIndex = 0
    var fastFoods = ["Zinger Burger", "Shawarma", "Club Sandwiches", "French Fries", "Nugets", "KFC Chicken", "Beef Burger"]
    var iceCreams = ["Chocolate Chip", "Belgium Chocolate", "Cramel Crunch", "Vanilla Cream", "Strawberry", "Tooty Fruity"]
    var cakes = ["Chocolate Cake", "Vanilla Cake", "Pineapple Cake", "Cheese Cake", "Fudge Cake", "Lava Cake"]
    
    var selectedCat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        searchView.roundCorners(radius: Float(searchView.frame.height / 2))
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.lightGray.cgColor
        
        let cellNib = UINib(nibName: "SearchCategoryCollectionViewCell", bundle: nil)
        searchCategoryCollectionView.register(cellNib, forCellWithReuseIdentifier: "SearchCategoryCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (searchCategoryCollectionView.frame.width / 3), height: searchCategoryCollectionView.frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        searchCategoryCollectionView.collectionViewLayout = layout
        
        let cellNib2 = UINib(nibName: "SearchTableViewCell", bundle: nil)
        categoryItemTableView.register(cellNib2, forCellReuseIdentifier: "SearchTableViewCell")
        categoryItemTableView.rowHeight = 70
        
    }

    @IBAction func btnSearchTapped(_ sender: UIButton) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCategoryCollectionViewCell", for: indexPath) as! SearchCategoryCollectionViewCell
        cell.lblCategory.text = categoryArray[indexPath.row]
        cell.selectedView.isHidden = selectedIndex == indexPath.row ? false : true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if (indexPath.row == 0 || indexPath.row == 3){
            selectedCat = 0
        }
        else if (indexPath.row == 1 || indexPath.row == 4){
            selectedCat = 1
        }
        else{
            selectedCat = 2
        }
        self.searchCategoryCollectionView.reloadData()
        self.categoryItemTableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(selectedCat == 0){
            return fastFoods.count
        }
        else if (selectedCat == 1){
            return iceCreams.count
        }
        else{
            return cakes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        if (selectedCat == 0){
            cell.lblCategoryItem.text = fastFoods[indexPath.row]
        }
        else if (selectedCat == 1){
            cell.lblCategoryItem.text = iceCreams[indexPath.row]
        }
        else{
            cell.lblCategoryItem.text = cakes[indexPath.row]
        }
        return cell
    }
    
}
