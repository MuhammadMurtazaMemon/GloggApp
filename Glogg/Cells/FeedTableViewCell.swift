//
//  FeedTableViewCell.swift
//  Glogg
//
//  Created by Murtaza on 09/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate: class {
    func favouriteImageTapped(indexPath: IndexPath)
}

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var lblRecipeName: UILabel!
    
    var indexPath = IndexPath()
    var delegate: FeedTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFavouriteTapped(_ sender: Any) {
        self.delegate.favouriteImageTapped(indexPath: indexPath)
    }
}
