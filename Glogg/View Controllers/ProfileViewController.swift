//
//  ProfileViewController.swift
//  Glogg
//
//  Created by Murtaza on 12/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var publicationView: UIView!
    @IBOutlet weak var lblPublication: UILabel!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var followersView: UIView!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var btnCreateList: UIButton!
    @IBOutlet weak var favouritesCollectionView: UICollectionView!
    @IBOutlet weak var publicationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        imgProfilePic.roundCorners(radius: Float(imgProfilePic.frame.height / 2))
        
        let cellNib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        favouritesCollectionView.register(cellNib, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        publicationCollectionView.register(cellNib, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (favouritesCollectionView.frame.width / 2.5), height: favouritesCollectionView.frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        favouritesCollectionView.collectionViewLayout = layout
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.itemSize = CGSize(width: (publicationCollectionView.frame.width / 2.5), height: publicationCollectionView.frame.height)
        layout2.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        layout2.minimumLineSpacing = 0
        publicationCollectionView.collectionViewLayout = layout2
    }
    
    @IBAction func btnCreateList(_ sender: UIButton) {
        
    }
    
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        cell.imgRecipe.roundCorners(radius: 20)
        
        if (collectionView == favouritesCollectionView){
            cell.lblRecipeName.isHidden = false
            cell.lblRecipeName.text = indexPath.row % 2 == 0 ? "Favourite lunches" : "My lovely inspirations"
            cell.imgRecipe.image = UIImage(named: indexPath.row % 2 == 0 ? "Recipe9" : "Recipe3")
        }
        else{
            cell.lblRecipeName.isHidden = true
            cell.imgRecipe.image = UIImage(named: indexPath.row % 2 == 0 ? "Recipe5" : "Recipe8")
        }
        
        return cell
        
    }
}
