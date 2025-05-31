//
//  Home.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct Home: View {
    
    @State var searchText: String = ""
    @StateObject private var homeVM = HomeViewModel()
    var filteredMovies: [MovieResults] {
        if searchText.isEmpty {
            return homeVM.movies
        } else {
            return homeVM.movies.filter {
                $0.originalTitle?.lowercased().hasPrefix(searchText.lowercased()) ?? false
            }
        }
    }

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
                    ForEach(filteredMovies) { movie in
                        NavigationLink(destination: MovieDetailsView(movieDetails: movie)) {
                            HomeCellView(movieDetails: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 20)
        .onAppear {
            homeVM.getMovies()
        }
    }
}

#Preview {
    Home()
}
