import DomainKit

public protocol UniversityStore: Sendable {
    func fetchAll() async throws -> [University]
    func save(_ universities: [University]) async throws
    func replaceAll(with universities: [University]) async throws
    func removeAll() async throws
}
