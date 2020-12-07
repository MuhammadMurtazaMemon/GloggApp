//
//  RecipeDetailViewController.swift
//  Glogg
//
//  Created by Murtaza on 02/12/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var ingredientsTabView: UIView!
    @IBOutlet weak var lblIngredients: UILabel!
    @IBOutlet weak var ingredientsSeperator: UIView!
    @IBOutlet weak var recipeTabView: UIView!
    @IBOutlet weak var lblRecipe: UILabel!
    @IBOutlet weak var recipeSeperator: UIView!
    
    @IBOutlet weak var ingredientsDetailTableView: UITableView!
    
    var ingredients = ["Beef", "Milk", "Sweet Potatoes", "Curd", "Salt", "All Spices"]
    var quantity = ["1 Kilo", "330 ml", "500 g", "2 st", "3 g", "15 ml"]
    
    @IBOutlet weak var caloriesView: UIView!
    @IBOutlet weak var protienView: UIView!
    @IBOutlet weak var fatsView: UIView!
    @IBOutlet weak var carbsView: UIView!
    
    @IBOutlet weak var caloriesCount: UILabel!
    @IBOutlet weak var protiensCount: UILabel!
    @IBOutlet weak var fatsCount: UILabel!
    @IBOutlet weak var carbsCount: UILabel!
    
    @IBOutlet weak var recipeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        let cellNib = UINib(nibName: "IngredientsDetailTableViewCell", bundle: nil)
        ingredientsDetailTableView.register(cellNib, forCellReuseIdentifier: "IngredientsDetailTableViewCell")
        ingredientsDetailTableView.rowHeight = 50
    
        ingredientsTabView.isUserInteractionEnabled = true
        ingredientsTabView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ingredientsTapped)))
        recipeTabView.isUserInteractionEnabled = true
        recipeTabView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(recipeTapped)))        
    }
    
    @objc func ingredientsTapped(){
        lblRecipe.textColor = UIColor.gray
        recipeSeperator.isHidden = true
        recipeTextView.isHidden = true
        lblIngredients.textColor = UIColor.black
        ingredientsSeperator.isHidden = false
        
    }
    
    @objc func recipeTapped(){
        lblIngredients.textColor = UIColor.gray
        ingredientsSeperator.isHidden = true
        lblRecipe.textColor = UIColor.black
        recipeSeperator.isHidden = false
        recipeTextView.isHidden = false
    }
    
}
extension RecipeDetailViewController : UITableViewDataSource, UITableViewDelegate {
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsDetailTableViewCell", for: indexPath) as! IngredientsDetailTableViewCell
            cell.lblIngredient.text = ingredients[indexPath.row]
            cell.lblQuantity.text = quantity[indexPath.row]
            return cell
    }
    
}
    

