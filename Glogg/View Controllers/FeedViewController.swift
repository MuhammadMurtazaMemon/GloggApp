//
//  FeedViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        let cellNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        feedTableView.register(cellNib, forCellReuseIdentifier: "FeedTableViewCell")
        feedTableView.rowHeight = 480
    }
    
}

extension FeedViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        cell.lblProfileName.text = indexPath.row % 2 == 0 ? "Eva Karlsson" : "Emma Slussen"
        cell.imgRecipe.image = UIImage(named: indexPath.row % 2 == 0 ? "Recipe1" : "Recipe2")
        cell.imgProfilePic.roundCorners(radius: Float(cell.imgProfilePic.frame.height / 2))
        cell.imgRecipe.roundCorners(radius: 20)
        return cell
    }
}
