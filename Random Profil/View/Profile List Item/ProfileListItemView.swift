//
//  ProfileListItemView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct ProfileListItemView: View {
    var name: String
    var location: String
    var email: String
    var imageURL: String
    @State var profileImage: UIImage?
    var viewModel: MaleFemaleViewModel
    
    var body: some View {
        HStack {
            if let image = profileImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 75, height: 75)
            } else {
                Image(systemName: "person")
                    .resizable()
                    .frame(width:55, height: 55)
                    .padding(10)
                    .foregroundColor(.gray)
            }
            
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                Group {
                    Text(location)
                    Text(email)
                }
                .lineLimit(1)
                .font(.body)
                .foregroundColor(.gray)
            }
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear {
            Task {
                let fetchImage = try? await viewModel.fetchImageFromNetwork(url: imageURL)
                await MainActor.run {
                    profileImage = fetchImage
                }
            }
        }
    }
    
}

struct ProfileListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListItemView(name: "Hello", location: "location", email: "@gmail", imageURL: "", profileImage: nil, viewModel: MaleFemaleViewModel(isMale: true))
        
    }
}
