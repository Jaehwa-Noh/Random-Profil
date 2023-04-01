//
//  MaleView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct MaleView: View, ProfilePage {
    
    @StateObject private var viewModel = MaleFemaleViewModel(isMale: true)
    
    private let imageCaching: ImageCaching = ImageCaching()
    
    var body: some View {
        ZStack {
            if viewModel.People.isEmpty {
                ProgressView()
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.People, id:\.self.uuid) { people in
                        ProfileListItemView(imageURL: people.imageURL, name: people.name, location: people.location, email: people.email, profileImage: people.profileImage)
                            .onAppear {
                                print(people.name)
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
