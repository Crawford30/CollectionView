//
//  NetworkingService.swift
//  CollectionViewUrl
//
//  Created by JOEL CRAWFORD on 2/12/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]
class NetworkingService {
    
    //======singleton, instance we shared====
    
    static let shared = NetworkingService()
    private init() {} //making it private to make sure its not initialised anywhere else
    
    //=======function to do the networking===
    //escaping becuase we are going to use the data even after the end of function has finished calling ie outside the scope of this function
    //====external name: success, internal name: successBlock
    
    //=============creating a session ====
    let session = URLSession.shared
    
    func getImages(success successBlock: @escaping(GetImageResponse) -> Void ) {
        
        //====url===
        guard let url = URL(string: "https://ichuzz2work.com/api/services/categories") else { return }
        
        
        var request = URLRequest(url: url)
        //request.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)
        
        session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            
            //=====if there is a valid data in, convert to json===
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                
                //=====if able to get json, pass into an object that handle the response=====
                
                let getImageResponse = try GetImageResponse(json: json) //since its a throw we use try
                
                DispatchQueue.main.async {
                    successBlock(getImageResponse)
                }
                
            } catch {
                
            }
            
        }.resume()
        
    }
    
    //func downloadImage()
    
    
    
}
