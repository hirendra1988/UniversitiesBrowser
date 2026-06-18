import XCTest
@testable import DomainKit

final class UniversityTests: XCTestCase {

    func test_init_setsAllPropertiesCorrectly() {

        // Given / When
        let university = University(
            id: "university-id",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        // Then
        XCTAssertEqual(university.id, "university-id")
        XCTAssertEqual(university.name, "MBZUAI")
        XCTAssertEqual(university.country, "United Arab Emirates")
        XCTAssertEqual(university.stateProvince, "Abu Dhabi")
        XCTAssertEqual(university.alphaTwoCode, "AE")
        XCTAssertEqual(university.domains, ["mbzuai.ac.ae"])
        XCTAssertEqual(university.webPages, ["https://mbzuai.ac.ae/"])
    }

    func test_equatable_whenModelsAreEqual_returnsTrue() {

        // Given
        let first = University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        let second = University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        // Then
        XCTAssertEqual(first, second)
    }

    func test_codable_roundTrip_preservesValues() throws {

        // Given
        let university = University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        // When
        let encoded = try JSONEncoder().encode(university)
        let decoded = try JSONDecoder().decode(
            University.self,
            from: encoded
        )

        // Then
        XCTAssertEqual(decoded, university)
    }

    func test_init_withNilStateProvince_setsValueToNil() {

        // Given / When
        let university = University(
            id: "1",
            name: "American College Of Dubai",
            country: "United Arab Emirates",
            stateProvince: nil,
            alphaTwoCode: "AE",
            domains: ["acd.ac.ae"],
            webPages: ["http://www.acd.ac.ae/"]
        )

        // Then
        XCTAssertNil(university.stateProvince)
    }
}
