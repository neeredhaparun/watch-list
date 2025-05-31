//
//  MovieDetailsView.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var movieDetails: MovieResults
    @State var moviePosterPath: String = ""
    @State var movieBackdropPath: String = ""
    @State var isFavorite: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            ScrollView(showsIndicators: false){
                VStack/*(alignment :  .leading)*/{
                    ZStack(alignment: .bottomLeading){
                        
                        AsyncImage(url: URL(string: "\(API.imageBaseURL)\(movieBackdropPath)")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 500)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 500)
                        }
                        
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.white]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(height: 100)
                        Button(action: {
                            withAnimation(.easeIn(duration: 0.2)) {
                                isFavorite.toggle()
                            }
                            
                            print("Add or remove from favorites")
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .font(.title)
                                .foregroundColor(.red)
                                .padding()
                                .background(Color.red.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .padding(.horizontal)

                    }
                    
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Text(movieDetails.originalTitle ?? "")
                                .font(.title)
                                .fontWeight(.medium)
                            Text(movieDetails.releaseDate ?? "")
                                .font(.system(size: 18))
                                .padding(.top, 5)
                            HStack{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(Color.white)
                                Text("Rating \(String(format: "%.1f", movieDetails.voteAverage ?? 0.0)) / 10")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 15)
                            .background(Color.black)
                            .cornerRadius(20)
                        }
                        Spacer()
                        
                        AsyncImage(url: URL(string: "\(API.imageBaseURL)\(moviePosterPath)")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 200)// or any placeholder view
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Text(movieDetails.overview ?? "")
                        .font(.title3)
                        .padding(10)
                    
                    
                    
//                                VStack{
//                                    Text("Genre")
//                                        .padding(.vertical, 8)
//                                        .padding(.horizontal)
//                                }
//                                .background(.ultraThinMaterial)
//                                .cornerRadius(20)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .stroke(Color.black, lineWidth: 2)
//                                )
//                                .padding(10)
                    
                    Spacer()
                }
            }
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 50)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            moviePosterPath = movieDetails.posterPath ?? ""
            movieBackdropPath = movieDetails.backdropPath ?? ""
        }
    }
}

#Preview {
    MovieDetailsView(movieDetails: MovieResults(id: 0, adult: false, backdropPath: "", genreIDs: [], originalLanguage: "", originalTitle: "", overview: "", popularity: 0.0, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 0.0, voteCount: 0))
}
