//
//  ClaimDetailView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation
import SwiftUI

struct ClaimDetailView: View {
    @ObservedObject var presenter: ClaimDetailPresenter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(presenter.claim.title.capitalized)
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Claim ID: \(presenter.claim.claimId)")
                    Text("Claimant ID: \(presenter.claim.claimantId)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(presenter.claim.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Claim Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
