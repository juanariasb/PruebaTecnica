//
//  CharacterDetailRouter.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit

protocol CharacterDetailRoutingLogic {}

protocol CharacterDetailDataPassing {

    var dataStore: CharacterDetailDataStore? { get }
}

class CharacterDetailRouter: NSObject, CharacterDetailRoutingLogic, CharacterDetailDataPassing {
    
    weak var viewController: CharacterDetailViewController?
    var dataStore: CharacterDetailDataStore?
    
}
