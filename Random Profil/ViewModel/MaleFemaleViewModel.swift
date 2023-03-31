//
//  MaleFemaleViewModel.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

class MaleFemaleViewModel: ObservableObject {

    @Published var People = [ProfileStruct]()
    
    init(isMale: Bool) {
        self.getGenderList(isMale: isMale)
    }
    
    private func getGenderList(isMale: Bool) {
        
    }
    
    
}
