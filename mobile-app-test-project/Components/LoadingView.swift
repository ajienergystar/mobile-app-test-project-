//
//  LoadingView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
