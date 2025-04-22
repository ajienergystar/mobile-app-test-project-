//
//  ClaimDetailPresenter.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation

class ClaimDetailPresenter: ObservableObject {
    @Published var claim: Claim
    
    init(interactor: ClaimDetailInteractorInputProtocol) {
        self.claim = interactor.claim
    }
}
