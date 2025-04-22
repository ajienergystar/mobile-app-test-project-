//
//  ClaimsListPresenter.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation

class ClaimsListPresenter: ClaimsListPresenterProtocol {
    private let interactor: ClaimsListInteractorInputProtocol
    private let router: ClaimsListRouterProtocol
    
    @Published var isLoading: Bool = false
    @Published var claims: [Claim] = []
    @Published var errorMessage: String?
    
    init(interactor: ClaimsListInteractorInputProtocol,
         router: ClaimsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func onAppear() {
        Task { @MainActor in
            isLoading = true
            do {
                claims = try await interactor.fetchClaims()
                errorMessage = nil
            } catch {
                errorMessage = error.localizedDescription
                claims = []
            }
            isLoading = false
        }
    }
    
    func searchClaims(with query: String) {
        // Search logic now handled in the view
    }
    
    func didSelectClaim(_ claim: Claim) {
        // Navigation handled by router
    }
}
