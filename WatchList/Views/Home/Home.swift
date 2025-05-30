//
//  Home.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct Home: View {
    
    @State var searchText: String = ""

    var body: some View {
        VStack(alignment: .leading){
            Text("Home")
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding(.horizontal, 15)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search movies...", text: $searchText)
                    .foregroundColor(.primary)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(0..<5){ index in
//                        HomeCellView()
                        NavigationLink(destination: MovieDetailsView()) {
                            HomeCellView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    Home()
}
