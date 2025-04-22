//
//  HeaderView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Insurance Claims")
                .font(.title.bold())
                .padding(.leading, 16)
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
    }
}

