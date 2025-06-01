//
//  MovieService.swift
//  WatchList
//
//  Created by ARMIAMAC on 31/05/25.
//

import Foundation

class MovieService {
    
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchPopularMovies(completion: @escaping (Result<[MovieResults], Error>) -> Void) {
//        let apiKey = "4d8e40b05d6eb0cbb8f034fc787ca34a"
        let urlString = "\(API.baseURL)/discover/movie?sort_by=popularity.desc&api_key=\(API.apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(AllMovieModel.self, from: data)
                completion(.success(decoded.results ?? [MovieResults]()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
