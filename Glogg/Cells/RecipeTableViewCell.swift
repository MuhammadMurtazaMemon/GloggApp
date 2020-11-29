//
//  RecipeTableViewCell.swift
//  Glogg
//
//  Created by Murtaza on 22/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var textViewRecipe: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
