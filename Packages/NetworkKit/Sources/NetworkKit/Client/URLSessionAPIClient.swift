import Foundation

public final class URLSessionAPIClient: APIClient {

    public init() {}

    public func request<T: Decodable>(_ request: URLRequest) async throws -> T {

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
