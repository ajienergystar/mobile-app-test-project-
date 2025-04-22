//
//  ClaimDetailRouter.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation
import SwiftUI

class ClaimDetailRouter: ClaimDetailRouterProtocol {
    static func createModule(with claim: Claim) -> AnyView {
        let interactor = ClaimDetailInteractor(claim: claim)
        let presenter = ClaimDetailPresenter(interactor: interactor)
        return AnyView(ClaimDetailView(presenter: presenter))
    }
}
