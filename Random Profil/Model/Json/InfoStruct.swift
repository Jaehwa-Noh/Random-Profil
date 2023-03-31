//
//  InfoStruct.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

struct InfoStruct: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
