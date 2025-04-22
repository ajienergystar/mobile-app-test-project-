//
//  ClaimDetailConfigurator.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import SwiftUI

struct ClaimDetailConfigurator {
    static func configure(with claim: Claim) -> some View {
        let interactor = ClaimDetailInteractor(claim: claim)
        let presenter = ClaimDetailPresenter(interactor: interactor)
        return ClaimDetailView(presenter: presenter)
    }
}
