//
//  ProfileListItemView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct ProfileListItemView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 75, height: 75)
            Spacer()
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.title)
                Group {
                    Text("Location")
                    Text("E-mail")
                }
                .font(.body)
                .foregroundColor(.gray)
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}

struct ProfileListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListItemView()
    }
}
