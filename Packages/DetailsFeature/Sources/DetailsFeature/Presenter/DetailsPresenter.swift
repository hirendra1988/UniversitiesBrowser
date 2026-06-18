import Foundation
import DomainKit

@MainActor
final class DetailsPresenter: ObservableObject {

    @Published private(set) var state: DetailsState
    @Published var isRefreshing = false

    /// ListingFeature injects this closure.
    var onRefresh: (() -> Void)?

    init(university: University) {
        self.state = DetailsState(university: university)
    }

    func refreshTapped() {
        guard !isRefreshing else { return }

        isRefreshing = true

        onRefresh?()

        Task {
            // Keep the refreshing state visible for 1 seconds
            try? await Task.sleep(nanoseconds: 1_000_000_000)

            self.isRefreshing = false
        }
    }
}
