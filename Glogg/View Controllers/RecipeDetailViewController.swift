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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        let cellNib = UINib(nibName: "IngredientsDetailTableViewCell", bundle: nil)
        ingredientsDetailTableView.register(cellNib, forCellReuseIdentifier: "IngredientsDetailTableViewCell")
        
        
    }
}
extension RecipeDetailViewController :UITableViewDelegate, UITableViewDataSource{
     
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
    

