//
//  MaleView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct MaleView: View, ProfilePage {
    
    @StateObject private var viewModel = MaleFemaleViewModel(isMale: true)
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.People, id:\.self.login.uuid) { people in
                    Text(people.login.uuid)
                }
                
                Text("Male View")
            }
            
        }
        .alert("서버 통신 문제", isPresented: $viewModel.isServerError) {
            Button("확인", role:.cancel) {
            }
        }
        
    }
}

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
