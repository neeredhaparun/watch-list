//
//  EmptyListView.swift
//  WatchList
//
//  Created by ARMIAMAC on 01/06/25.
//

import SwiftUI

struct EmptyListView: View {
    
    @State var contentText: String
    @State var contentImage: String
    
    var body: some View {
        VStack{
            Image(contentImage)
                .resizable()
                .frame(width: 80, height: 80)
            Text(contentText)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    EmptyListView(contentText: "The list is Emptydfgdfgdfgdfgdfgdfg dfgdfgdfgdfgdfgd", contentImage: "favoritesEmpty")
}
