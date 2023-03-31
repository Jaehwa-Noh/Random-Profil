//
//  RandomUserClient.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

class RandomUserClient {
    enum Endpoints {
        static let base = "https://randomuser.me/api/"
        static let getPerson = "?results=30"
        
        case getPersonList(gender: String)
        
        var url: String {
            switch self {
            case .getPersonList(let gender):
                return Endpoints.base + Endpoints.getPerson + "&gender=\(gender)"
            }
        }
    }
}
