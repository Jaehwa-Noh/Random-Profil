//
//  MaleView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct MaleView: View, ProfilePage {
    
    @StateObject private var viewModel = MaleFemaleViewModel(isMale: true)
    @State var isError: Bool = false
    private var isMale = true
    
    private let imageCaching: ImageCaching = ImageCaching()
    
    var body: some View {
        ZStack {
            if viewModel.people.isEmpty && !isError {
                ProgressView()
                    .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.people, id:\.self.uuid) { people in
                        ProfileListItemView(
                            name: people.name,
                            location: people.location,
                            email: people.email,
                            imageURL: people.imageURL,
                            profileImage: people.profileImage,
                            viewModel: viewModel)
                        .onAppear {
                            if people == viewModel.people.last {
                                viewModel.getMoreList(isMale: isMale)
                            }
                        }
                    }
                }
            }
        }
        .refreshable {
            isError = false
            viewModel.getGenderList(isMale: isMale)
        }
        
        .alert("서버 통신 문제", isPresented: $viewModel.isServerError) {
            Button("확인", role:.cancel) {
                isError = true
            }
        }
        
    }
}

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
