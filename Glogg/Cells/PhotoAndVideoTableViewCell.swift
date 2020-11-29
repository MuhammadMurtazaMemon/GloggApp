//
//  PhotoAndVideoTableViewCell.swift
//  Glogg
//
//  Created by Murtaza on 15/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class PhotoAndVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var nameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
