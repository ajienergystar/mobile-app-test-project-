//
//  View+Alerts.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

extension View {
    func errorAlert(error: Binding<String?>) -> some View {
        alert("Error", isPresented: .constant(error.wrappedValue != nil)) {
            Button("OK") {
                error.wrappedValue = nil
            }
        } message: {
            Text(error.wrappedValue ?? "")
        }
    }
}
