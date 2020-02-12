//
//  AllCategoriesImages.swift
//  CollectionViewUrl
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import Foundation
struct AllCategoriesImages {
    //=====setting id to be private
    
    private let id: Int
    let name: String
    let image: String
    
    init?(json: JSON) {
        //init? can failed
    
    guard let id = json["id"] as? Int,
    let name = json["name"] as? String,
    let image = json["image"] as? String
    else { return nil }
        
        //===initialising
        
        self.id = id
        self.name = name
        self.image = image
        
    }
    
   
        
    }

