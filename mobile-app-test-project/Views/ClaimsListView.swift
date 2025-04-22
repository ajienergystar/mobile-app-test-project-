//
//  ClaimsListView.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct ClaimsListView: View, ClaimsListViewProtocol {
    @ObservedObject var presenter: ClaimsListPresenter
    
    @State private var searchText = ""
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var selectedClaim: Claim?
    @State private var showDetail = false
    
    private var filteredClaims: [Claim] {
        guard !searchText.isEmpty else { return presenter.claims }
        let lowercasedSearch = searchText.lowercased()
        return presenter.claims.filter {
            $0.title.lowercased().contains(lowercasedSearch) ||
            $0.description.lowercased().contains(lowercasedSearch)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HeaderView()
                SearchView(searchText: $searchText)
                ContentList(
                    isLoading: presenter.isLoading,
                    errorMessage: presenter.errorMessage,
                    filteredClaims: filteredClaims
                )
            }
            .navigationDestination(for: Claim.self) { claim in
                ClaimDetailConfigurator.configure(with: claim)
            }
        }
        .onAppear {
            presenter.onAppear()
        }
    }
    
    func showLoading() { isLoading = true }
    func hideLoading() { isLoading = false }
    func showClaims(_ claims: [Claim]) { presenter.claims = claims }
    func showError(_ message: String) { errorMessage = message }
}
