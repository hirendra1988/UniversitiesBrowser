import XCTest
@testable import NetworkKit
@testable import DomainKit

final class UniversitiesAPIServiceTests: XCTestCase {

    func test_fetchUniversities_returnsMappedDomainModels() async throws {

        // Given
        let json = """
        [
            {
                "state-province": "Abu Dhabi",
                "domains": ["mbzuai.ac.ae"],
                "alpha_two_code": "AE",
                "web_pages": ["https://mbzuai.ac.ae/"],
                "country": "United Arab Emirates",
                "name": "Mohamed bin Zayed University of Artificial Intelligence (MBZUAI)"
            }
        ]
        """

        let mockClient = MockAPIClient(
            result: .success(Data(json.utf8))
        )

        let sut = UniversitiesAPIService(
            client: mockClient
        )

        // When
        let universities = try await sut.fetchUniversities(
            country: "United Arab Emirates"
        )

        // Then
        XCTAssertEqual(universities.count, 1)

        let university = try XCTUnwrap(universities.first)

        XCTAssertEqual(
            university.name,
            "Mohamed bin Zayed University of Artificial Intelligence (MBZUAI)"
        )

        XCTAssertEqual(
            university.country,
            "United Arab Emirates"
        )

        XCTAssertEqual(
            university.stateProvince,
            "Abu Dhabi"
        )

        XCTAssertEqual(
            university.alphaTwoCode,
            "AE"
        )

        XCTAssertEqual(
            university.domains,
            ["mbzuai.ac.ae"]
        )

        XCTAssertEqual(
            university.webPages,
            ["https://mbzuai.ac.ae/"]
        )
    }

    func test_fetchUniversities_throwsError_whenAPIClientFails() async {

        // Given
        struct DummyError: Error {}

        let mockClient = MockAPIClient(
            result: .failure(DummyError())
        )

        let sut = UniversitiesAPIService(
            client: mockClient
        )

        // When / Then
        do {
            _ = try await sut.fetchUniversities(
                country: "United Arab Emirates"
            )
            XCTFail("Expected an error to be thrown")
        } catch {
            // Success
        }
    }
}
