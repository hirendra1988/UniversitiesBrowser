import Foundation

public protocol FetchUniversitiesUseCase {
    func execute(country: String) async throws -> [University]
}
