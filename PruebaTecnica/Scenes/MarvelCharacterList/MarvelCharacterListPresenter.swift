//
//  MarvelCharacterListPresenter.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit
import MarvelClient

protocol MarvelCharacterListPresentationLogic {
    
    func presentFetchCharacters(data: CharactersResponse?, error: APIClientError?)
}

class MarvelCharacterListPresenter: MarvelCharacterListPresentationLogic {
    
    var viewController: MarvelCharacterListDisplayLogic?
    
    func presentFetchCharacters(data: CharactersResponse?, error: APIClientError?) {
        
        if let success = data {
            
            viewController?.successFetchCharacters(viewModel: CharacterModel.transform(data: success))
        } else {
        
            viewController?.errorFetchCharacters()
        }
    }
}
