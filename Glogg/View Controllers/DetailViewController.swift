//
//  DetailViewController.swift
//  Glogg
//
//  Created by Murtaza on 26/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnFollow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
    }
    
    @IBAction func btnFavouriteTapped(_ sender: Any) {
    }
    
    @IBAction func btnPlayTapped(_ sender: Any) {
        let vc = RecipeDetailViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnFollowTapped(_ sender: Any) {
    }
    
}
