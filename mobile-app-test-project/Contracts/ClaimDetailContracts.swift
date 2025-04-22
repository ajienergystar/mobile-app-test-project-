//
//  ClaimDetailContracts.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation
import SwiftUI

protocol ClaimDetailViewProtocol {
    func showClaimDetails(_ claim: Claim)
}

protocol ClaimDetailPresenterProtocol: ObservableObject {
    var claim: Claim { get }
}

protocol ClaimDetailInteractorInputProtocol {
    var claim: Claim { get }
}

protocol ClaimDetailRouterProtocol {
    static func createModule(with claim: Claim) -> AnyView
}
