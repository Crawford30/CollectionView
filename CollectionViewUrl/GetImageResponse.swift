//
//  GetImageResponse.swift
//  CollectionViewUrl
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import Foundation

struct GetImageResponse {
    //seeting images to be of type array AllCategoriesImages
    let images: [AllCategoriesImages]
    
    init(json: JSON) throws {
         print(json)
        
        //======accessing data from the json object==
        guard let data =  (json["data"] as? [JSON]) else { throw MyError.someError } //when we could get the json as of they we throw that error
        
        //=========we map each images==
       // "http://www.macmillandictionaryblog.com/wp-content/uploads/2011/07/Small-Talk-image.jpg")!)
        
//        guard let image = UIImage(named: "img") else { return }
//        let jpegData = image.jpegData(compressionQuality: 1.0)
//        let pngData = image.pngData()
       
        let images = data.map{  AllCategoriesImages(json: $0) }.compactMap{ $0 }
        self.images = images
        
        
        
        
        
    }
}
