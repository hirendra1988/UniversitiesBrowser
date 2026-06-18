import XCTest
@testable import ListingFeature
@testable import DomainKit

@MainActor
final class ListingPresenterTests: XCTestCase {

    func test_load_success_updatesLoadedState() async {

        let university = University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: ["mbzuai.ac.ae"],
            webPages: ["https://mbzuai.ac.ae/"]
        )

        let interactor = MockListingInteractor()
        interactor.result = .success([university])

        let router = MockListingRouter()

        let presenter = ListingPresenter(
            interactor: interactor,
            router: router
        )

        presenter.load()

        // Allow async task to complete
        try? await Task.sleep(nanoseconds: 100_000_000)

        switch presenter.state {
        case .loaded(let universities):
            XCTAssertEqual(universities.count, 1)
            XCTAssertEqual(universities.first?.name, "MBZUAI")
        default:
            XCTFail("Expected loaded state")
        }
    }

    func test_load_whenEmpty_updatesEmptyState() async {

        let interactor = MockListingInteractor()
        interactor.result = .success([])

        let presenter = ListingPresenter(
            interactor: interactor,
            router: MockListingRouter()
        )

        presenter.load()

        try? await Task.sleep(nanoseconds: 100_000_000)

        if case .empty = presenter.state {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected empty state")
        }
    }

    func test_load_whenInteractorFails_updatesErrorState() async {

        struct DummyError: Error {}

        let interactor = MockListingInteractor()
        interactor.result = .failure(DummyError())

        let presenter = ListingPresenter(
            interactor: interactor,
            router: MockListingRouter()
        )

        presenter.load()

        try? await Task.sleep(nanoseconds: 100_000_000)

        if case .error = presenter.state {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected error state")
        }
    }

    func test_didSelect_navigatesToDetails() {

        let university = University(
            id: "1",
            name: "MBZUAI",
            country: "United Arab Emirates",
            stateProvince: "Abu Dhabi",
            alphaTwoCode: "AE",
            domains: [],
            webPages: []
        )

        let interactor = MockListingInteractor()
        interactor.result = .success([])

        let router = MockListingRouter()

        let presenter = ListingPresenter(
            interactor: interactor,
            router: router
        )

        presenter.didSelect(university)

        XCTAssertTrue(router.didNavigate)
        XCTAssertEqual(router.selectedUniversity?.id, "1")
    }
}
