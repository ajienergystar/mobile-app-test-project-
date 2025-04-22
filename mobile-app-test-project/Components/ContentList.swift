//
//  ContentView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct ContentList: View {
    let isLoading: Bool
    let errorMessage: String?
    let filteredClaims: [Claim]
    
    var body: some View {
        if isLoading {
            LoadingView()
        } else if let errorMessage = errorMessage {
            ErrorView(message: errorMessage)
        } else {
            ClaimsContentListView(claims: filteredClaims)
        }
    }
}
