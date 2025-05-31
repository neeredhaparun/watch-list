//
//  FavoritesCellView.swift
//  WatchList
//
//  Created by ARMIAMAC on 31/05/25.
//

import SwiftUI

struct FavoritesCellView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center){
                Image("dummyMovie")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    Text("Title of the movie")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.black)
                    HStack{
                        VStack(alignment: .leading){
                            Text("English")
                                .fontWeight(.medium)
                            Text("20/05/2024")
                                .fontWeight(.medium)
                        }
                        .foregroundStyle(Color.gray)
                        Spacer()
                        RatingCircleView(rating: 9)
                            .padding(.trailing)
                    }
                }
                Spacer()
            }
//            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RatingCircleView: View {
    var rating: Double // Ex: 7.8 out of 10
    
    private var progress: Double {
        rating / 10
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6)
                .opacity(0.2)
                .foregroundColor(.gray)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green]), center: .center),
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeOut(duration: 0.6), value: progress)

            Text(String(format: "%.1f", rating))
                .font(.caption)
                .fontWeight(.bold)
        }
        .frame(width: 50, height: 50)
    }
}


#Preview {
    FavoritesCellView()
}
