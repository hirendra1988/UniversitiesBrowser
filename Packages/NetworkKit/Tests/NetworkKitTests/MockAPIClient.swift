import Foundation
@testable import NetworkKit

struct MockAPIClient: APIClient {

    let result: Result<Data, Error>

    func request<T: Decodable>(_ request: URLRequest) async throws -> T {
        switch result {
        case .success(let data):
            return try JSONDecoder().decode(T.self, from: data)

        case .failure(let error):
            throw error
        }
    }
}
