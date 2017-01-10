//
//  PokemonController.swift
//  PoxedexII
//
//  Created by Chandi Abey  on 9/6/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

class PokemonController {
    
    static func catchPokemon(searchTerm: String, completion: ((pokemon: Pokemon?) -> Void)) {
        
        let baseURL =  "http://pokeapi.co/api/v2/pokemon/"
        let searchURL = baseURL  + searchTerm.lowercaseString
        let url = NSURL(string: searchURL)
        
        guard let unwrappedURL = url else {
            completion(pokemon: nil)
            print("Optional URL is nil")
            return
        }
        
        NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get) { (data, error) in
            //this is where we parse the data!!!
            
            //unwrap the data
            guard let data = data,
                      responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else
            { completion(pokemon: nil)
              print("Unable to get data")
              return
            }
            
            //serialize the data
            guard let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                      //this is the main big dictionary and as far as we can go
                   jsonDictionary = jsonAnyObject as? [String: AnyObject] else {
                    completion(pokemon: nil)
                    print("Error, unable to serialize.")
                    return
                    }
            
            //make a model object that is our pokemon
            let pokemon = Pokemon(dictionary: jsonDictionary)
            completion(pokemon: pokemon)
        
        }
    }
}