import Foundation

public enum UniversitiesEndpoint: Endpoint {

    case search(country: String)

    public var path: String {
        "/search"
    }

    public var method: HTTPMethod {
        .get
    }

    public var queryItems: [URLQueryItem] {
        switch self {
        case .search(let country):
            return [
                URLQueryItem(name: "country", value: country)
            ]
        }
    }

    public var headers: [String : String] {
        [:]
    }
}
