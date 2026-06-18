import DomainKit

@MainActor
protocol ListingInteractorProtocol {
    func loadUniversities() async throws -> [University]
    func refreshUniversities() async throws -> [University]
}

@MainActor
final class ListingInteractor: ListingInteractorProtocol {

    private let repository: UniversityRepository

    init(repository: UniversityRepository) {
        self.repository = repository
    }

    func loadUniversities() async throws -> [University] {
        try await repository.fetchUniversities(
            country: "United Arab Emirates"
        )
    }

    func refreshUniversities() async throws -> [University] {
        try await repository.refreshUniversities(
            country: "United Arab Emirates"
        )
    }
}
