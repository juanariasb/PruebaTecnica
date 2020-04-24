//
//  CharacterModel.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import Foundation
import MarvelClient

struct CharacterModel {
        
    var id: Int
    var name: String
    var description: String
    var comics: [String]
    var thumbnail: String
    
    init() {
        
        id = 0
        name = ""
        description = ""
        comics = []
        thumbnail = ""
    }
    
    init(id: Int, name: String, description: String, comics: [String], thumbnail: String) {
        
        self.id = id
        self.name = name
        self.description = description
        self.comics = comics
        self.thumbnail = thumbnail
    }
    
    static func transform(data: CharactersResponse) -> [CharacterModel] {
        
        var characters: [CharacterModel] = []
        
        if let charactersResponse = data.data?.results {
            
            for character in charactersResponse {

                let url = "\(character.thumbnail?.path ?? "").\(character.thumbnail?.extension ?? "")"
                
                var comics: [String] = []
                for comic in character.comics?.items ?? [] {
                    comics.append(comic.name ?? "")
                }
                
                characters.append(CharacterModel(id: character.id ?? 0, name: character.name ?? "", description: character.description ?? "", comics: comics, thumbnail: url))
            }
        }
        
        return characters
    }
}
