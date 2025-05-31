//
//  TabBar.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
//                    NavigationView{
//                        Home()
//                            .tag(Tab.house)
//                    }
                    NavigationView {
                        Home()
                    }
                    .tag(Tab.house)
                    NavigationView {
                        Favorites()
                    }
                    .tag(Tab.heart)
                }
            }
            VStack{
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    TabBar()
}
