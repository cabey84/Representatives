//
//  RepresentativeController.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation


class RepresentativeController {
    
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")!
    
    static func searchRepByState(_ state: String, completion: @escaping (_ representatives: [Representative]) -> Void) {
        
        let urlParameters = ["state": "\(state)", "output": "json" ]
        
        let url = baseURL //else { fatalError("No URL found."); return}
        
        NetworkController.performRequestForURL(baseURL, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                let responseDatastring = NSString(data: data, encoding: String.Encoding.utf8) else {
                print("No data returned")
                completion(representatives: [])
                 return
            }
       
            if error != nil {
                print(error?.localizedDescription)
                completion(representatives: [])
                
            } else if responseDatastring.contains("error") {
                print("Error:\(responseDatastring)")
                completion(representatives: [])
            }
            
            guard let jsonAnyObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                    //ask Skylar: confirming that this is the initial dictionary
                        let jsonDictionary = jsonAnyObject as? [String: AnyObject],
                        let arrayOfDictionaries = jsonDictionary["results"] as? [[String: AnyObject]] else {
                            print("unable to serialize objects.  \n Response:\(responseDatastring)")
                            completion(representatives: [])
                            return
                        }
            print(jsonAnyObject)
        
            //creating a representative object for each dicitonary in the array!!!!
            let representatives = arrayOfDictionaries.flatMap{Representative(dictionary: $0)}
            completion(representatives: representatives)
            
        }
    
    }
    
}
