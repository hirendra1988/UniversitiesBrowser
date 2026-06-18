import DomainKit

public protocol UniversitiesAPIServiceProtocol: Sendable {
    func fetchUniversities(country: String) async throws -> [University]
}
