//
//  MarvelCharacterListInteractor.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit

protocol MarvelCharacterListBussinessLogic {
    
    func fetchCharacters(limit: Int, offset: Int, hash: String, apikey: String, ts: String)
    func setCharacter(characterDetail: CharacterModel)
}

protocol MarvelCharacterListDataStore {
    
    var character: CharacterModel? { get set }
}

class MarvelCharacterListInteractor: MarvelCharacterListBussinessLogic, MarvelCharacterListDataStore {
    
    var presenter: MarvelCharacterListPresentationLogic?
    var worker: CharactersWorker?
    
    var character: CharacterModel?
    
    required init() {
        worker = CharactersWorker()
    }
    
    func setCharacter(characterDetail: CharacterModel) {
        
        character = characterDetail
    }
    
    func fetchCharacters(limit: Int, offset: Int, hash: String, apikey: String, ts: String) {
        
        worker?.fetchCharactersList(limit: limit, offset: offset, hash: hash, apikey: apikey, ts: ts, success: { (data) in
            
            self.presenter?.presentFetchCharacters(data: data, error: nil)
            
        }, fail: { (error) in
            
            self.presenter?.presentFetchCharacters(data: nil, error: nil)
        })
    }
}
