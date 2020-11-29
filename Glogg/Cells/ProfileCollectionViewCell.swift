//
//  ProfileCollectionViewCell.swift
//  Glogg
//
//  Created by Murtaza on 10/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var lblRecipeName: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnEditTapped(_ sender: UIButton) {
        
    }
}
