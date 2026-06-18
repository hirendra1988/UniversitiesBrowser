import Foundation
import DomainKit

extension UniversityDTO {

    func toDomain() -> University {

        University(
            name: name,
            country: country,
            stateProvince: stateProvince,
            alphaTwoCode: alphaTwoCode,
            domains: domains,
            webPages: webPages
        )
    }
}
