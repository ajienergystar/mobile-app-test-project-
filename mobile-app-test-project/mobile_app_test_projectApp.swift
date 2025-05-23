//
//  mobile_app_test_projectApp.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

@main
struct mobile_app_test_projectApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ClaimsListRouter.createModule()
        }
    }
}
