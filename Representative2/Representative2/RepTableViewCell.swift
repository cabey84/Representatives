//
//  RepTableViewCell.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class RepTableViewCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //REMEMBER to pass in representative. otherwise, no way to update it.
    func updateCell(_ representative: Representative) {
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
            
    }

}


