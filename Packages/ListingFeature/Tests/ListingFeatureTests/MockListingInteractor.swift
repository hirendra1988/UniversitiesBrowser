import Foundation
@testable import ListingFeature
@testable import DomainKit

final class MockListingInteractor: ListingInteractorProtocol {

    var result: Result<[University], Error>!

    func loadUniversities() async throws -> [University] {
        switch result! {
        case .success(let universities):
            return universities
        case .failure(let error):
            throw error
        }
    }

    func refreshUniversities() async throws -> [University] {
        try await loadUniversities()
    }
}
