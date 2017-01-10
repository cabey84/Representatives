//
//  StateListTableViewController.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StateController.states.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statecell", for: indexPath)
        let state = StateController.states[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
   
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statedetailsegue" {
            if let detailVC = segue.destination as? StateDetailTableViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                let state = StateController.states[index]
                detailVC.state = state
            }
        }
    }

}
