//
//  imageUrlCell.swift
//  CollectionViewUrl
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class imageUrlCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //=======configuring cell
    func configure(allCategoriesImages: AllCategoriesImages) {
        
        titleLabel.text = allCategoriesImages.name
       // self.imageView.image = allCategoriesImages.image
        //imageView.image = UIImage(data: allCategoriesImages.image) as? Data
//        let thumbnail1Data =  Data(base64Encoded: base64String as String, options: NSData.Base64DecodingOptions()
//            
//        imageView?.image = UIImage(data: thumbnail1Data as Data)
        
        
        
    }
}
