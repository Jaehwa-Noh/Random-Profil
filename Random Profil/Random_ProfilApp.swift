//
//  Random_ProfilApp.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

@main
struct Random_ProfilApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileListItemView(imageURL: "https://randomuser.me/api/portraits/thumb/women/21.jpg")
        }
    }
}
