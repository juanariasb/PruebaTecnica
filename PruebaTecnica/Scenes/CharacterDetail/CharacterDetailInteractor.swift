//
//  CharacterDetailInteractor.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit

protocol CharacterDetailBussinessLogic {
    
    func getCharacter() -> CharacterModel
}

protocol CharacterDetailDataStore {
    
    var character: CharacterModel? { get set }
}

class CharacterDetailInteractor: CharacterDetailBussinessLogic, CharacterDetailDataStore {
    
    var presenter: CharacterDetailPresentationLogic?
    
    var character: CharacterModel?
    
    func getCharacter() -> CharacterModel {
        
        return character ?? CharacterModel()
    }
}
