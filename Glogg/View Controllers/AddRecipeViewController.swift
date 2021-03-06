//
//  AddRecipeViewController.swift
//  Glogg
//
//  Created by Murtaza on 11/10/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {

    @IBOutlet weak var publishRecipeTableView: UITableView!
    var cellNib2: UINib!
    var layout: UICollectionViewFlowLayout!
    
    var recipeImages = [UIImage]()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        
        let cellNib = UINib(nibName: "PhotoAndVideoTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib, forCellReuseIdentifier: "PhotoAndVideoTableViewCell")
        cellNib2 = UINib(nibName: "PhotosAndVideosCollectionViewCell", bundle: nil)
        let cellNib3 = UINib(nibName: "IngredientsTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib3, forCellReuseIdentifier: "IngredientsTableViewCell")
        let cellNib4 = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        publishRecipeTableView.register(cellNib4, forCellReuseIdentifier: "RecipeTableViewCell")
        
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 166, height: 166)
        
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.mediaTypes = ["public.image"]
    }
    
    func showImagePickerAlert(){
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let galleryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddRecipeViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoAndVideoTableViewCell", for: indexPath) as! PhotoAndVideoTableViewCell
            cell.nameView.layer.cornerRadius = cell.nameView.frame.height / 2
            cell.nameView.layer.borderColor = UIColor.lightGray.cgColor
            cell.nameView.layer.borderWidth = 1
            cell.photoCollectionView.register(cellNib2, forCellWithReuseIdentifier: "PhotosAndVideosCollectionViewCell")
            cell.photoCollectionView.collectionViewLayout = layout
            cell.photoCollectionView.dataSource = self
            cell.photoCollectionView.delegate = self
            cell.photoCollectionView.reloadData()
            return cell
        }
        else if (indexPath.row == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsTableViewCell", for: indexPath) as! IngredientsTableViewCell
            cell.ingredientView.layer.cornerRadius = cell.ingredientView.frame.height / 2
            cell.ingredientView.layer.borderColor = UIColor.lightGray.cgColor
            cell.ingredientView.layer.borderWidth = 1
            
            cell.quantityView.layer.cornerRadius = cell.quantityView.frame.height / 2
            cell.quantityView.layer.borderColor = UIColor.lightGray.cgColor
            cell.quantityView.layer.borderWidth = 1

            cell.btnAdd.isHidden = indexPath.row != 3
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0){
            return 360
        }
        else if (indexPath.row == 1 || indexPath.row == 2){
            return 63
        }
        else if (indexPath.row == 3){
            return 100
        }
        else{
            return 400
        }
    }
}

extension AddRecipeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosAndVideosCollectionViewCell", for: indexPath) as! PhotosAndVideosCollectionViewCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.btnDelete.isHidden = indexPath.row == 0
        cell.btnAdd.isHidden = indexPath.row > 0
        cell.imgMedias.roundCorners(radius: Float(20))
        cell.imgMedias.layer.borderWidth = 1
        cell.imgMedias.layer.borderColor = UIColor.orange.cgColor
        if (indexPath.row == 0){
            cell.imgMedias.image = nil
        }
        else{
            cell.imgMedias.image = recipeImages[indexPath.row - 1]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            showImagePickerAlert()
        }
    }
    
}

extension AddRecipeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        self.recipeImages.append(image)
        self.publishRecipeTableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension AddRecipeViewController: PhotosAndVideosCollectionViewCellDelegate{
    func deleteImageTapped(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Sure to remove?", preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.recipeImages.remove(at: indexPath.row)
            self.publishRecipeTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    
    }
}
