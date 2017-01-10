//
//  StateDetailTableViewController.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    /*
     Update your viewDidLoad function to call the RepresentativeController.searchRepsByState function using the unwrapped state property. In the completion closure, set self.stateRepresentatives to the returned representatives and reload the UITableView on the main thread.
     */
    
    
    //****add a property to populate the table view
    var representatives: [Representative] = []
    
    //set by the statelistviewcontroller in the prepareforsegue function
    var state: String?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
        RepresentativeController.searchRepByState(state) { (representatives)  in
            //populating empty array with represnetatives
            self.representatives = representatives
            //Why do we have to say self here? 
            //DON'T FORGET DISPATCH_ASYNC
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
                })
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    //CUSTOM CELL- DONT FOREGET TO UNWRAP THIS!!!!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statedetailcell", for: indexPath) as? RepTableViewCell
        let representative = representatives[indexPath.row]
        cell?.updateCell(representative)
        
        return cell ?? RepTableViewCell()
    }
    
}


