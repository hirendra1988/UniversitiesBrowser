import Foundation

public enum RequestBuilder {

    public static func makeRequest(
        endpoint: Endpoint,
        configuration: APIConfiguration
    ) throws -> URLRequest {

        var components = URLComponents(
            url: configuration.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )

        components?.queryItems = endpoint.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        endpoint.headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }

        return request
    }
}
