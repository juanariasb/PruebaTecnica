//
//  CharactersWorker.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 21/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import Foundation
import MarvelClient

class CharactersWorker {
    
    var apiClient = APIClient.default
    
    func fetchCharactersList(limit: Int, offset: Int, hash: String, apikey: String, ts: String, success: @escaping((_ data: CharactersResponse?) -> Void), fail: @escaping((_ error: APIClientError?) -> Void)) {
        
        let request = MarvelClient.Characters.GetCharacterList.Request(limit: limit, offset: offset, hash: hash, apikey: apikey, ts: ts)
        
        apiClient.makeRequest(request) { response in
            
            switch (response.result) {
                
            case .success(let data):
                
                if let data = data.response as? CharactersResponse {

                    success(data)
                }
                
            case .failure(let error):
                
                fail(error)
            }
        }
    }
}
