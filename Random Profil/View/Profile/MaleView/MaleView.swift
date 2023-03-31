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
        ZStack {
            if viewModel.People.isEmpty {
                ProgressView()
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.People, id:\.self.login.uuid) { people in
                        let name = "\(people.name.title) \(people.name.first) \(people.name.last)"
                        ProfileListItemView(imageURL: people.picture.thumbnail, name: name, location: people.location.street.name, email: people.email)
                            .onAppear {
                                print(name)
                            }
                    }
                }
            }
        }
        .refreshable {
            print("refresh")
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
