//
//  ProfilePagerView.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/30.
//

import SwiftUI

struct ProfilePagerView: View {
    private var tabList = ["남자", "여자"]
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    ForEach(Array(tabList.enumerated()), id: \.offset) {
                        index, tabTitle in
                        Button {
                            selectedTab = index
                        } label: {
                            GeometryReader { geo in
                                VStack {
                                    
                                    Text(tabTitle)
                                        .foregroundColor(selectedTab == index ? .black : .gray)
                                    
                                    Rectangle()
                                        .fill(Color.green)
                                        .opacity(selectedTab == index ? 1 : 0)
                                        .frame(width:geo.size.width, height: 2)
                                    
                                    Spacer()
                                    
                                }
                                
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
                
            }
            .navigationTitle("랜덤 프로필")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfilePagerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePagerView()
    }
}
