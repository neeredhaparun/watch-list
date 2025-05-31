//
//  CustomTabBar.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .foregroundStyle(Color.white)
                        .scaleEffect(selectedTab == tab ? 1.5 : 1.0)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                selectedTab = tab
                            }
                            
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 50)
            .background(Color.black)
//            .background(Color.indigo)
            .cornerRadius(30)
            .padding(.horizontal, 80)
            
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.house))
}
