//
//  Favorites.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct Favorites: View {
    
    @State var isTesting: Bool = ProcessInfo.processInfo.arguments.contains("UITesting")
    
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
                    if favList.isEmpty {
                        EmptyListView(contentText: "No movies are added to favorite list", contentImage: "favoritesEmpty")
                    }
                    else{
                        ForEach(favList){ favMovie in
                            NavigationLink(destination: MovieDetailsView(movieDetails: favMovie)) {
                                FavoritesCellView(movieDetails: favMovie)
                            }
                            
                            
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
            .accessibilityIdentifier("FavoritesScrollView")
        }
        .padding(.bottom, 20)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            
            if isTesting && ProcessInfo.processInfo.environment["UITEST_PREPOPULATE"] != nil {
                // Load test data instead of real data
                favList = [MovieResults.testData()]
            }
            else{
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
}
extension MovieResults {
    static func testData() -> MovieResults {
        return MovieResults(
            id: 999,
            adult: false,
            backdropPath: "/testBackdrop.jpg",
            originalLanguage: "en",
            originalTitle: "Test Movie",
            overview: "This is a test movie for UI testing",
            popularity: 10.0,
            posterPath: "/testPoster.jpg",
            releaseDate: "2023-01-01",
            title: "Test Movie",
            video: false,
            voteAverage: 8.5,
            voteCount: 100
        )
    }
}

#Preview {
    Favorites()
}
