import Foundation

public struct APIConfiguration: Sendable {
    public let baseURL: URL

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }

    public static let universities = APIConfiguration(
        baseURL: URL(string: "http://universities.hipolabs.com")!
    )
}
