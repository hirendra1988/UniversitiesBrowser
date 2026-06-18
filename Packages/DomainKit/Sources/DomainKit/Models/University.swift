import Foundation

public struct University: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let country: String
    public let stateProvince: String?
    public let alphaTwoCode: String
    public let domains: [String]
    public let webPages: [String]

    public init(
        id: String? = nil,
        name: String,
        country: String,
        stateProvince: String?,
        alphaTwoCode: String,
        domains: [String],
        webPages: [String]
    ) {
        self.id = id ?? "\(name)-\(country)"
        self.name = name
        self.country = country
        self.stateProvince = stateProvince
        self.alphaTwoCode = alphaTwoCode
        self.domains = domains
        self.webPages = webPages
    }
}
