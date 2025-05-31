//
//  HomeModel.swift
//  WatchList
//
//  Created by ARMIAMAC on 31/05/25.
//

import Foundation

struct AllMovieModel : Codable {
//    let page : Int?
    let results : [MovieResults]?
//    let total_pages : Int?
//    let total_results : Int?

    enum CodingKeys: String, CodingKey {

//        case page = "page"
        case results = "results"
//        case total_pages = "total_pages"
//        case total_results = "total_results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([MovieResults].self, forKey: .results)
//        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
//        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
    }

}

struct MovieResults : Codable, Identifiable {
    let id: Int
    let adult: Bool?
    let backdropPath: String?
    let genreIDs: [Int]?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

}

