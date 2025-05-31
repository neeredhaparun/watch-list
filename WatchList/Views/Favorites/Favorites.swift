//
//  Favorites.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct Favorites: View {
    
    @FetchRequest(
        entity: FavoriteMovie.entity(),
        sortDescriptors: []
    ) var favorites: FetchedResults<FavoriteMovie>
    
    @State var favList = [MovieResults]()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Favorites")
                .font(.system(size: 28))
                .fontWeight(.bold)
                .padding(.horizontal, 15)
            ScrollView(showsIndicators: false){
                VStack{
                    ForEach(favList){ favMovie in
                        NavigationLink(destination: MovieDetailsView(movieDetails: favMovie)) {
                            FavoritesCellView(movieDetails: favMovie)
                        }
                        
                        
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
        }
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        .onAppear {
//            for movie in favorites {
//                print("Title: \(movie.originalTitle ?? "No Title")")
//                print("Poster Path: \(movie.posterPath ?? "No Poster Path")")
//            }
            
            favList = favorites.map { movie in
                MovieResults(
                    id: Int(movie.id),
                    adult: nil,
                    backdropPath: nil,
                    originalLanguage: nil,
                    originalTitle: movie.originalTitle,
                    overview: nil,
                    popularity: nil,
                    posterPath: movie.posterPath,
                    releaseDate: nil,
                    title: movie.originalTitle,
                    video: nil,
                    voteAverage: nil,
                    voteCount: nil
                )
            }
            
            
            
        }
        
    }
}

#Preview {
    Favorites()
}
