//
//  HomeCellView.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct HomeCellView: View {
    
    @State var movieDetails: MovieResults
    @State var moviePoster: String = ""
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center){
                
                AsyncImage(url: URL(string: "\(API.imageBaseURL)\(moviePoster)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 200)// or any placeholder view
                }
                
                VStack(alignment: .leading){
                    Text(movieDetails.originalTitle ?? "")
                        .font(.system(size: 24))
                        .fontWeight(.medium)
//                    Text("Rating: \(String(format: "%.1f", movieDetails.voteAverage ?? 0.0)) / 10")
                    HStack{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.yellow)
                        Text("\(String(format: "%.1f", movieDetails.voteAverage ?? 0.0)) / 10")
                    }
                    Spacer()
                    HStack{
                        Text(movieDetails.releaseDate ?? "")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                        Spacer()
                        VStack{
                            Text(movieDetails.originalLanguage ?? "")
                                .padding(.vertical, 8)
                                .padding(.horizontal)
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    }
                    
                }
                .padding(.leading, 5)
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .onAppear {
            moviePoster = movieDetails.posterPath ?? ""
        }
    }
}

#Preview {
    HomeCellView(movieDetails: MovieResults(id: 0, adult: false, backdropPath: "", originalLanguage: "en", originalTitle: "Thunderbolts", overview: "", popularity: 0.0, posterPath: "/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg", releaseDate: "2025-02-08", title: "Thunderbolts", video: false, voteAverage: 8.2789, voteCount: 0))
}
