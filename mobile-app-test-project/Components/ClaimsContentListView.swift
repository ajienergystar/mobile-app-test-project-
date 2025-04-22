//
//  ClaimsListView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct ClaimsContentListView: View {
    let claims: [Claim]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(claims) { claim in
                    ClaimRow(claim: claim)
                    Divider()
                }
            }
        }
    }
}

