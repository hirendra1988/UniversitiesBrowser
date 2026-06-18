import DomainKit
import NetworkKit
import PersistenceKit

final class DefaultUniversityRepository: UniversityRepository {

    private let api: UniversitiesAPIServiceProtocol
    private let store: UniversityStore

    init(
        api: UniversitiesAPIServiceProtocol,
        store: UniversityStore
    ) {
        self.api = api
        self.store = store
    }

    func fetchUniversities(country: String) async throws -> [University] {
        do {
            let remote = try await api.fetchUniversities(country: country)
            try await store.replaceAll(with: remote)
            return remote
        } catch {
            let cached = try await store.fetchAll()

            if !cached.isEmpty {
                return cached
            }

            throw error
        }
    }

    func refreshUniversities(country: String) async throws -> [University] {
        let remote = try await api.fetchUniversities(country: country)
        try await store.replaceAll(with: remote)
        return remote
    }

}
