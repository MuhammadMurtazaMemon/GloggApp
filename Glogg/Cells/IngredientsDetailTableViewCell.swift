//
//  IngredientsDetailTableViewCell.swift
//  Glogg
//
//  Created by rahat on 05/12/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class IngredientsDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lblIngredient: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
