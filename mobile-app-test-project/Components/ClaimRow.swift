//
//  ClaimRow.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct ClaimRow: View {
    let claim: Claim
    
    var body: some View {
        NavigationLink(value: claim) {
            CardView(
                cornerRadius: 12,
                shadowOpacity: 0.15,
                color: .gray
            ) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(claim.title.capitalized)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(claim.description)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Claim ID: \(claim.claimId)")
                        Text("•")
                        Text("Claimant ID: \(claim.claimantId)")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
