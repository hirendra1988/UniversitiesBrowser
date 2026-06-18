import XCTest
@testable import DetailsFeature
@testable import DomainKit

@MainActor
final class DetailsPresenterTests: XCTestCase {

    func test_init_setsInitialState() {

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
        let presenter = DetailsPresenter(
            university: university
        )

        // Then
        XCTAssertEqual(
            presenter.state.university.name,
            "MBZUAI"
        )

        XCTAssertFalse(
            presenter.isRefreshing
        )
    }

    func test_refreshTapped_setsRefreshingToTrue() async {

        // Given
        let presenter = DetailsPresenter(
            university: makeUniversity()
        )

        // When
        presenter.refreshTapped()

        // Then
        XCTAssertTrue(
            presenter.isRefreshing
        )
    }

    func test_refreshTapped_invokesRefreshClosure() {

        // Given
        var refreshCalled = false

        let presenter = DetailsPresenter(
            university: makeUniversity()
        )

        presenter.onRefresh = {
            refreshCalled = true
        }

        // When
        presenter.refreshTapped()

        // Then
        XCTAssertTrue(refreshCalled)
    }

    func test_refreshTapped_whenAlreadyRefreshing_doesNothing() {

        // Given
        let presenter = DetailsPresenter(
            university: makeUniversity()
        )

        presenter.isRefreshing = true

        var refreshCallCount = 0

        presenter.onRefresh = {
            refreshCallCount += 1
        }

        // When
        presenter.refreshTapped()

        // Then
        XCTAssertEqual(refreshCallCount, 0)
    }

    // MARK: - Helpers

    private func makeUniversity() -> University {
        University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )
    }

}
