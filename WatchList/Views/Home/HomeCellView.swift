//
//  HomeCellView.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct HomeCellView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center){
                Image("dummyMovie")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                VStack(alignment: .leading){
                    Text("Title of the movie")
                    Text("Rating")
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    HomeCellView()
}
