import XCTest
import CoreData
@testable import PersistenceKit
@testable import DomainKit

@MainActor
final class CoreDataUniversityStoreTests: XCTestCase {

    func test_saveAndFetchUniversities() async throws {

        // Given
        let persistenceController = PersistenceController(inMemory: true)
        let store = CoreDataUniversityStore(
            context: persistenceController.container.viewContext
        )

        let universities = [
            University(
                id: "1",
                name: "MBZUAI",
                country: "United Arab Emirates",
                stateProvince: "Abu Dhabi",
                alphaTwoCode: "AE",
                domains: ["mbzuai.ac.ae"],
                webPages: ["https://mbzuai.ac.ae/"]
            )
        ]

        // When
        try await store.save(universities)
        let fetched = try await store.fetchAll()

        // Then
        XCTAssertEqual(fetched.count, 1)
        XCTAssertEqual(fetched.first?.id, "1")
        XCTAssertEqual(fetched.first?.name, "MBZUAI")
        XCTAssertEqual(fetched.first?.country, "United Arab Emirates")
        XCTAssertEqual(fetched.first?.stateProvince, "Abu Dhabi")
        XCTAssertEqual(fetched.first?.alphaTwoCode, "AE")
        XCTAssertEqual(fetched.first?.domains, ["mbzuai.ac.ae"])
        XCTAssertEqual(
            fetched.first?.webPages,
            ["https://mbzuai.ac.ae/"]
        )
    }

    func test_fetchAll_whenStoreIsEmpty_returnsEmptyArray() async throws {

        // Given
        let persistenceController = PersistenceController(inMemory: true)
        let store = CoreDataUniversityStore(
            context: persistenceController.container.viewContext
        )

        // When
        let fetched = try await store.fetchAll()

        // Then
        XCTAssertTrue(fetched.isEmpty)
    }

    func test_removeAll_removesAllUniversities() async throws {

        // Given
        let persistenceController = PersistenceController(inMemory: true)
        let store = CoreDataUniversityStore(
            context: persistenceController.container.viewContext
        )

        let universities = [
            University(
                id: "1",
                name: "MBZUAI",
                country: "United Arab Emirates",
                stateProvince: "Abu Dhabi",
                alphaTwoCode: "AE",
                domains: [],
                webPages: []
            )
        ]

        try await store.save(universities)

        // When
        try await store.removeAll()

        let fetched = try await store.fetchAll()

        // Then
        XCTAssertTrue(fetched.isEmpty)
    }

    func test_replaceAll_replacesExistingUniversities() async throws {

        // Given
        let persistenceController = PersistenceController(inMemory: true)
        let store = CoreDataUniversityStore(
            context: persistenceController.container.viewContext
        )

        let oldUniversity = University(
            id: "1",
            name: "Old University",
            country: "UAE",
            stateProvince: nil,
            alphaTwoCode: "AE",
            domains: [],
            webPages: []
        )

        let newUniversity = University(
            id: "2",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        try await store.save([oldUniversity])

        // When
        try await store.replaceAll(with: [newUniversity])

        let fetched = try await store.fetchAll()

        // Then
        XCTAssertEqual(fetched.count, 1)
        XCTAssertEqual(fetched.first?.id, "2")
        XCTAssertEqual(fetched.first?.name, "MBZUAI")
        XCTAssertEqual(
            fetched.first?.domains,
            ["mbzuai.ac.ae"]
        )
    }
}
