//
//  SplashView.swift
//  WatchList
//
//  Created by ARMIAMAC on 01/06/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.2
    @State private var opacity = 0.5

    
    var body: some View {
        if isActive{
            TabBar()
        }
        else{
            VStack{
                VStack{
                    Image("appLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
        
    }
}

#Preview {
    SplashView()
}
