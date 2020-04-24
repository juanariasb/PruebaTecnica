//
//  Utilities.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 24/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import Foundation
import CommonCrypto

class Utilities {
    
    static func encryptHashMD5() -> String {
        
        return Encrypt.md5("\(Constants.ts)\(Constants.privateKey)\(Constants.publicKey)") ?? ""
    }
}
