//
//  mobile_app_test_projectTests.swift
//  mobile-app-test-projectTests
//
//  Created by Aji Prakosa on 22/4/25.
//

import XCTest
@testable import mobile_app_test_project

final class mobile_app_test_projectTests: XCTestCase {

    // MARK: - Mock Classes

    class MockRequestPerformer: RequestPerformer {
        var shouldThrowError = false
        var mockClaims: [Claim] = []
        var errorToThrow: Error = NetworkError.serverError(NSError(domain: "Test", code: 500))

        func performRequest(_ url: String) async throws -> [Claim] {
            if shouldThrowError {
                throw errorToThrow
            }
            return mockClaims
        }
    }

    // MARK: - Test Decoding JSON into Claim

    func testClaimDecoding() throws {
        let jsonData = """
        {
            "userId": 1,
            "id": 101,
            "title": "Insurance Claim",
            "body": "This is a description"
        }
        """.data(using: .utf8)!

        let decoded = try JSONDecoder().decode(Claim.self, from: jsonData)
        XCTAssertEqual(decoded.claimantId, 1)
        XCTAssertEqual(decoded.claimId, 101)
        XCTAssertEqual(decoded.title, "Insurance Claim")
        XCTAssertEqual(decoded.description, "This is a description")
    }

    // MARK: - Test Success Case of ClaimService

    func testClaimServiceReturnsClaimsSuccessfully() async throws {
        let mockPerformer = MockRequestPerformer()
        let expectedClaims = [
            Claim(claimantId: 1, claimId: 1001, title: "Test", description: "Description")
        ]
        mockPerformer.mockClaims = expectedClaims

        let service = ClaimService(requestPerformer: mockPerformer)
        let claims = try await service.fetchClaims()

        XCTAssertEqual(claims, expectedClaims)
        XCTAssertEqual(claims.first?.title, "Test")
    }

    // MARK: - Test Failure Case of ClaimService

    func testClaimServiceThrowsError() async {
        let mockPerformer = MockRequestPerformer()
        mockPerformer.shouldThrowError = true

        let service = ClaimService(requestPerformer: mockPerformer)

        do {
            _ = try await service.fetchClaims()
            XCTFail("Expected error was not thrown")
        } catch let error as NetworkError {
            switch error {
            case .serverError:
                XCTAssertTrue(true)
            default:
                XCTFail("Unexpected error type")
            }
        } catch {
            XCTFail("Unexpected error type: \(error)")
        }
    }

    // MARK: - Functional Test: ClaimsListInteractor

    func testClaimsListInteractorReturnsData() async throws {
        let mockPerformer = MockRequestPerformer()
        mockPerformer.mockClaims = [Claim(claimantId: 5, claimId: 555, title: "Health", description: "Coverage details")]

        let service = ClaimService(requestPerformer: mockPerformer)
        let interactor = ClaimsListInteractor(service: service)

        let result = try await interactor.fetchClaims()
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.claimId, 555)
    }

    // MARK: - Functional Test: ClaimsListPresenter loads data

    func testClaimsListPresenterFetchesData() async {
        let mockPerformer = MockRequestPerformer()
        mockPerformer.mockClaims = [Claim(claimantId: 99, claimId: 999, title: "Dental", description: "Tooth surgery")]

        let interactor = ClaimsListInteractor(service: ClaimService(requestPerformer: mockPerformer))
        let router = ClaimsListRouter()
        let presenter = ClaimsListPresenter(interactor: interactor, router: router)

        await MainActor.run {
            presenter.onAppear()
        }

        XCTAssertEqual(presenter.claims.count, 1)
        XCTAssertEqual(presenter.claims.first?.title, "Dental")
        XCTAssertNil(presenter.errorMessage)
        XCTAssertFalse(presenter.isLoading)
    }

    // MARK: - Performance Test (Optional)

    func testPerformanceExample() throws {
        self.measure {
            _ = (0..<1000).map { _ in Claim(claimantId: 1, claimId: 1, title: "Test", description: "Test") }
        }
    }
}
