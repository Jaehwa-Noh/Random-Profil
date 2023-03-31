//
//  LoginStruct.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

struct LoginStruct: Decodable {
    
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}
