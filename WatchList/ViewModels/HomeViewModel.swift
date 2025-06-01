//
//  HomeViewModel.swift
//  WatchList
//
//  Created by ARMIAMAC on 31/05/25.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var movies: [MovieResults] = []
    @Published var errorMessage: String? = nil
    
    private let movieService = MovieService()
    
    func getMovies() {
        
        if ProcessInfo.processInfo.environment["UITesting"] == "true" {
            self.movies = [MovieResults(id: 1,
                                        adult: false,
                                        backdropPath: "/test.jpg",
                                        originalLanguage: "en",
                                        originalTitle: "Movie title",
                                        overview: "Movie overview",
                                        popularity: 0.0,
                                        posterPath: "/test.jpg",
                                        releaseDate: "2024-05-03",
                                        title: "Movie title",
                                        video: false,
                                        voteAverage: 7.6,
                                        voteCount: 1200)]
        }
        else {
            movieService.fetchPopularMovies { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        self?.movies = movies
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
}
