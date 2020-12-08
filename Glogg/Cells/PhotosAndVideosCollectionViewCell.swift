//
//  PhotosAndVideosCollectionViewCell.swift
//  Glogg
//
//  Created by Murtaza on 16/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

protocol PhotosAndVideosCollectionViewCellDelegate: class {
    func deleteImageTapped(indexPath: IndexPath)
}

class PhotosAndVideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgMedias: UIImageView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    var indexPath = IndexPath()
    var delegate: PhotosAndVideosCollectionViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnAddTapped(_ sender: Any) {
    }
    
    @IBAction func btnDeleteTapped(_ sender: Any) {
        self.delegate.deleteImageTapped(indexPath: indexPath)
    }
    
}
