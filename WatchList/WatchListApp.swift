//
//  WatchListApp.swift
//  WatchList
//
//  Created by ARMIAMAC on 30/05/25.
//

import SwiftUI

@main
struct WatchListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
