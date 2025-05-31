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
