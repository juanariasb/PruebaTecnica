//
//  Constants.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 24/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import Foundation

class Constants {
    
    static let baseURL = "https://gateway.marvel.com:443/v1/public/"
    static let publicKey = "eecde285788aff1a04940d4a9fde3cf4"
    static let privateKey = "5ae191af75728cc30537626cca08ba3271d19870"
    static let ts = "\(Date().timeIntervalSince1970)"
    static let limit = 100
    static let offset = 200
}
