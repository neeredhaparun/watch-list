//
//  Favorites.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Favorites")
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding(.horizontal, 15)
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(0..<5){ index in
//                        NavigationLink(destination: MovieDetailsView()) {
                            FavoritesCellView()
//                        }
                        
                        
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Favorites()
}
