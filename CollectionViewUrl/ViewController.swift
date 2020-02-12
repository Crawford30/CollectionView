//
//  ViewController.swift
//  CollectionViewUrl
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //=====creating a reference to a collectionview====
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var to store the reponse===
       var images = [AllCategoriesImages]() // giving it a blank default value of  AllCategoriesImages
       

    override func viewDidLoad() {
        super.viewDidLoad()
        //=======calling the function====
        
        NetworkingService.shared.getImages { (response) in
            //print(response.images)
            
            self.images = response.images
            
            self.collectionView.reloadData() //updating it
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }


}


//=======accessing UICollection View Datasource by doing this=====
extension  ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagercell", for: indexPath) as? imageUrlCell else { return UICollectionViewCell() }
        cell.configure(allCategoriesImages: images[indexPath.item] )
        return cell
       }
}
