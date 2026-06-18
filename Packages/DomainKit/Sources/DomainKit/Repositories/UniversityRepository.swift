import Foundation

public protocol UniversityRepository: Sendable {

    /// Fetches universities from API and updates local cache.
    func fetchUniversities(country: String) async throws -> [University]

    /// Refreshes data from remote source.
    func refreshUniversities(country: String) async throws -> [University]
}
