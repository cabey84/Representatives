//
//  Pokemon.swift
//  PoxedexII
//
//  Created by Chandi Abey  on 9/6/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

struct Pokemon {
    
    private let kName = "name"
    private let kId = "id"
    private let kAbilities = "abilities"
    private let kImage = "sprites"
    
    let name: String
    let id: Int
    //since we are setting this up to have a list of all abilities, we list it out as an array
    let abilities: [String]
    let imageEndpoint: String
}

extension Pokemon {
    
    init?(dictionary: [String: AnyObject]) {
        //we are going inside the dictionary we want and using the keywords to pull the values out and casting them as the type we want it to be
        guard let name = dictionary[kName] as? String,
                  id   = dictionary[kId] as? Int,
            abilitiesArray = dictionary[kAbilities] as? [[String: AnyObject]],
        imageEndpoints = dictionary[kImage] as? [String: AnyObject],
        //we can go one step further because imageEndpoints is a dictionary, contrast this from the abilities array where we would need to flatmap
            imageEndpoint = imageEndpoints["front_default"] as? String
        else { return nil }
        
        
        //below are not included in the guard statement b/c flatmap does not yield an optional 
        //abilities array [] -> {}, {} , {}
        //we are tyring to get inside of the key value pair, if the $0 represnts one of these 3 dictionaries
            //this will go through each of the 3 dictionaries and go to ability and give us the value 
        //dot notation $0.1, .1 works if it was cast as [String: Stirng: AnyOjbect], 0 is the key and 1 represents the value, we cant use dot notation here because we are going through each element in the array
        let abilityDictionaries = abilitiesArray.flatMap{$0["ability"] as? [String: AnyObject]}
        //flatmap created another array of dictionaries , we just created an array of dictionaries with just the abilitiy , slot and hidden are not there anymore 
        
        //to get the name, we would create an array of strings
        let abilities = abilityDictionaries.flatMap{$0["name"] as? String}
        
        
        self.name = name
        self.id = id
        self.abilities = abilities
        self.imageEndpoint = imageEndpoint
    }
}
    
    
