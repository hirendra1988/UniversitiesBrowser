import Foundation
import DomainKit

@MainActor
final class ListingPresenter: ObservableObject {

    @Published private(set) var state: ListingState = .idle

    private let interactor: ListingInteractorProtocol
    private let router: ListingRouterProtocol

    init(
        interactor: ListingInteractorProtocol,
        router: ListingRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }

    func load() {
        Task {
            state = .loading

            do {
                let universities = try await interactor.loadUniversities()

                if universities.isEmpty {
                    state = .empty
                } else {
                    state = .loaded(universities)
                }
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }

    @MainActor
    func refresh() async {
        do {
            let universities = try await interactor.refreshUniversities()

            if universities.isEmpty {
                state = .empty
            } else {
                state = .loaded(universities)
            }
        } catch {
            state = .error(error.localizedDescription)
        }
    }

    func retry() {
        load()
    }

    @MainActor
    func didSelect(_ university: University) {
        router.showDetails(
            for: university,
            onRefresh: { [weak self] in
                self?.load()   // or self?.refresh()
            }
        )
    }
}
