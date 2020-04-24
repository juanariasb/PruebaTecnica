//
//  MarvelCharacterListRouter.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit

protocol MarvelCharacterListRoutingLogic {
    
    func routeToCharacterDetail(segue: UIStoryboardSegue?)
}

protocol MarvelCharacterListDataPassing {
    
    var dataStore: MarvelCharacterListDataStore? { get }
}

class MarvelCharacterListRouter: NSObject, MarvelCharacterListRoutingLogic, MarvelCharacterListDataPassing {
    
    weak var viewController: MarvelCharacterListViewController?
    var dataStore: MarvelCharacterListDataStore?
    
    func routeToCharacterDetail(segue: UIStoryboardSegue?) {
        
        if let segue = segue {
            
            let destinationVC = segue.destination as! CharacterDetailViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToCharacterDetail(source: dataStore!, destination: &destinationDS)
        }
    }
    
    func passDataToCharacterDetail(source: MarvelCharacterListDataStore, destination: inout CharacterDetailDataStore) {
        
        destination.character = source.character
    }
}
