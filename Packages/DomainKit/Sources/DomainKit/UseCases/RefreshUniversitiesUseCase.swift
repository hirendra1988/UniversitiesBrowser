import Foundation

public protocol RefreshUniversitiesUseCase {
    func execute(country: String) async throws -> [University]
}
