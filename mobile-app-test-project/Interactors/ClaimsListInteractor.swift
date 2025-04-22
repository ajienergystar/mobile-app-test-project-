//
//  ClaimsListInteractor.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation

class ClaimsListInteractor: ClaimsListInteractorInputProtocol {
    private let service: ClaimServiceProtocol
    
    init(service: ClaimServiceProtocol = ClaimService()) {
        self.service = service
    }
    
    func fetchClaims() async throws -> [Claim] {
        return try await service.fetchClaims()
    }
}
