//
//  PokemonSearchViewController.swift
//  PoxedexII
//
//  Created by Chandi Abey  on 9/6/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    //uisearchbar is the delegator, and viewcontroller is the delegatee, so we drag from search bar to the yellow on the stroyboard. to do it programatically, you do it searchBar.delegate = self in the viewdidload.
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //this function tells the viewcontroller that the search button was tapped
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //note- with failable initializers you always return nil. otherwise you 
        
        guard let searchTerm = searchBar.text else { return }
        PokemonController.catchPokemon(searchTerm) { (pokemon) in
            //bc pokemon is optional, unwrap the optional that is passed in. b/c we are inside another function, need to use self.
            guard let pokemon = pokemon else { return }
       
                //NOTE: we didnt need dispatch async here b/c it was already called in imagecontroller which is then called here
                ImageController.imageForURL(pokemon.imageEndpoint, completion: { (image) in
                    guard let image = image else { return }
                    self.pokemonImageView.image = image
                    self.nameLabel.text = pokemon.name
                    //bc abilites is an array do joinwith separator
                    self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joinWithSeparator(","))"
                    //b/c id is an int and we need to make it into a string
                    self.idLabel.text = "ID: \(pokemon.id)"
            
            })
        }
        searchBar.resignFirstResponder()

    }
}
