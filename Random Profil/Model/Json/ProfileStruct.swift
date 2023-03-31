//
//  ProfileStruct.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

struct RandomUserResponseStruct: Decodable {
    let results: [ProfileStruct]
    let info: InfoStruct
}

struct ProfileStruct: Decodable {
    let gender: String
    let name: NameStruct
    let location: LocationStruct
    let email: String
    let login: LoginStruct
    let dob: DobStruct
    let registered: RegisteredStruct
    let phone: String
    let cell: String
    let id: IdStruct
    let picture: PictureStruct
    let nat: String
}

