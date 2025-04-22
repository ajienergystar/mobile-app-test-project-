//
//  ClaimsListContracts.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation
import SwiftUI

protocol ClaimsListViewProtocol {
    func showLoading()
    func hideLoading()
    func showClaims(_ claims: [Claim])
    func showError(_ message: String)
}

protocol ClaimsListPresenterProtocol: ObservableObject {
    var isLoading: Bool { get }
    var claims: [Claim] { get }
    var errorMessage: String? { get }
    
    func onAppear()
    func searchClaims(with query: String)
    func didSelectClaim(_ claim: Claim)
}


protocol ClaimsListInteractorInputProtocol {
    func fetchClaims() async throws -> [Claim]
}

protocol ClaimsListRouterProtocol {
    func navigateToClaimDetail(with claim: Claim) -> AnyView
}
