//
//  FeedViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    var selectedRows = [Int]()
    var filmArray = [FilmModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getFilmData()
    }
    
    func setupViews(){
        let cellNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        feedTableView.register(cellNib, forCellReuseIdentifier: "FeedTableViewCell")
        feedTableView.rowHeight = 480
    }
    
    func getFilmData(){
        
        SVProgressHUD.show()
        
        let request = AF.request("https://swapi.dev/api/films", method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: nil)
        
        request.responseJSON { (response) in
            SVProgressHUD.dismiss()
            print("Data Without SwiftyJSON....")
            print(response)
            print("\n")
            print("Data With SwiftyJSON")
            let myJSON = JSON(response.value)
            print(myJSON)
            let filmArray = myJSON["results"].arrayValue
            for film in filmArray{
                let model = FilmModel()
                model.updateModelWithJSON(json: film)
                model.filmImage = "https://homepages.cae.wisc.edu/~ece533/images/fruits.png"
                self.filmArray.append(model)
            }
            self.feedTableView.reloadData()
        }
        
    }
    
}

extension FeedViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        let film = filmArray[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        cell.lblProfileName.text = film.filmName
        cell.lblRecipeName.text = film.filmProducer
        cell.imgRecipe.sd_setImage(with: URL(string: film.filmImage), placeholderImage: UIImage(named: "Recipe1"))
        cell.imgProfilePic.roundCorners(radius: Float(cell.imgProfilePic.frame.height / 2))
        cell.imgRecipe.roundCorners(radius: 20)
        if (self.selectedRows.contains(indexPath.row)){
            cell.btnFavourite.setImage(UIImage(named: "heart-icon-fill"), for: .normal)
        }
        else{
            cell.btnFavourite.setImage(UIImage(named: "Favourite"), for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FeedViewController: FeedTableViewCellDelegate{
    func favouriteImageTapped(indexPath: IndexPath) {
        if selectedRows.contains(indexPath.row){
            self.selectedRows.removeAll(where: {$0 == indexPath.row})
        }
        else{
            self.selectedRows.append(indexPath.row)
        }
        self.feedTableView.reloadData()
    }
}
