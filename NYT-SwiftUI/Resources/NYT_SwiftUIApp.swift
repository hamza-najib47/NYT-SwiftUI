//
//  NYT_SwiftUIApp.swift
//  NYT-SwiftUI
//
//  Created by Hamza Najib on 04/10/2022.
//

import SwiftUI

@main
struct NYT_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
