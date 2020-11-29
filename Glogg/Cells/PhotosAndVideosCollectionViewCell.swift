//
//  PhotosAndVideosCollectionViewCell.swift
//  Glogg
//
//  Created by Murtaza on 16/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class PhotosAndVideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgMedias: UIImageView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnAddTapped(_ sender: Any) {
    }
    
    @IBAction func btnDeleteTapped(_ sender: Any) {
    }
    
}
