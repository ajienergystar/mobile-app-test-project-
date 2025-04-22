//
//  Claim.swift
//  mobile-app-test-project
//
//  Created by Aji Prakosa on 22/4/25.
//

struct Claim: Codable {
    let claimantId: Int
    let claimId: Int
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case claimantId = "userId"
        case claimId = "id"
        case title
        case description = "body"
    }
}
