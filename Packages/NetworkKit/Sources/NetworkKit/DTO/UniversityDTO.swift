import Foundation

struct UniversityDTO: Codable {

    let stateProvince: String?
    let domains: [String]
    let alphaTwoCode: String
    let webPages: [String]
    let country: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case stateProvince = "state-province"
        case domains
        case alphaTwoCode = "alpha_two_code"
        case webPages = "web_pages"
        case country
        case name
    }
}
