import Foundation

public protocol APIClient: Sendable {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T
}
