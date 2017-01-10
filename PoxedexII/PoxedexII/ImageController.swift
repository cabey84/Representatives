//
//  ImageController.swift
//  PoxedexII
//
//  Created by Chandi Abey  on 9/6/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    //generic so can be used in any app. 
    
    static func imageForURL(url: String, completion: ((image: UIImage?)-> Void)) {
        
        //without guard statement, it would be an optional NSURL
        guard let url = NSURL(string: url) else { fatalError("Image URL optional is nil") }
        
        //call network controller and use the second performrequest
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
          
            
            guard let data = data else {  completion(image: nil); return }
                //normally we would want to call completion but can insert one line of code
//                completion(image: nil)
//                return
            

//            let image = UIImage(data: data)
//            completion(image: image)
            //call dispatch async b/c uiimage is on main queue
            dispatch_async(dispatch_get_main_queue(), {
            
               //throw in data and returns optional UIImage
            completion(image: UIImage(data: data))
            
            })
        }
        
    }
}
    
