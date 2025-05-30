//
//  ContentView.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {

        Text("Hello World")
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
