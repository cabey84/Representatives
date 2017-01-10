//
//  Representative.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

class Representative {
    
    
    fileprivate let kName = "name"
    fileprivate let kParty = "party"
    fileprivate let kState = "state"
    fileprivate let kDistrict = "district"
    fileprivate let kPhone = "phone"
    fileprivate let kOffice = "office"
    fileprivate let kLink = "link"
    
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    //note: Dictionary we are referring to here is the {} -> []-> {}. all keys and values are in the same level so no need to parse this in the model. we can do so in the model [[String: AnyObject]] and use flatmap to get them out 
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
                  let party = dictionary[kParty] as? String,
                  let state = dictionary[kState] as? String,
                  let district = dictionary[kDistrict] as? String,
                  let phone = dictionary[kPhone] as? String,
                  let office = dictionary[kOffice] as? String,
                  let link = dictionary[kLink] as? String
        else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
        
    }
    
}
