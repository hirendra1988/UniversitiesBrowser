import Foundation
@testable import ListingFeature
@testable import DomainKit

@MainActor
final class MockListingRouter: ListingRouterProtocol {

    private(set) var didNavigate = false
    private(set) var selectedUniversity: University?

    func showDetails(
        for university: University,
        onRefresh: @escaping () -> Void
    ) {
        didNavigate = true
        selectedUniversity = university
    }
}
