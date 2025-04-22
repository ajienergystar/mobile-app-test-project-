//
//  mobile_app_test_projectApp.swift
//  mobile-app-test-project
//
//  Created by mac on 22/4/25.
//

import SwiftUI

@main
struct mobile_app_test_projectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
