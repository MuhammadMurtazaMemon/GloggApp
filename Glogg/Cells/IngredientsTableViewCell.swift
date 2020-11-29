//
//  IngredientsTableViewCell.swift
//  Glogg
//
//  Created by Murtaza on 21/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var textFieldIngredient: UITextField!
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnAddTapped(_ sender: Any) {
    }
}
