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
            favList = favorites.map { movie in
                MovieResults(
                    id: Int(movie.id),
                    adult: movie.adult,
                    backdropPath: movie.backdropPath,
                    originalLanguage: movie.originalLanguage,
                    originalTitle: movie.originalTitle,
                    overview: movie.overview,
                    popularity: movie.popularity,
                    posterPath: movie.posterPath,
                    releaseDate: movie.releaseDate,
                    title: movie.originalTitle,
                    video: movie.video,
                    voteAverage: movie.voteAverage,
                    voteCount: Int(movie.voteCount)
                )
            }
            
            
            
        }
        
    }
}

#Preview {
    Favorites()
}
