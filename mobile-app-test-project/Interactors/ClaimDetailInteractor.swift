//
//  ClaimDetailInteractor.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

import Foundation

class ClaimDetailInteractor: ClaimDetailInteractorInputProtocol {
    let claim: Claim
    
    init(claim: Claim) {
        self.claim = claim
    }
}
