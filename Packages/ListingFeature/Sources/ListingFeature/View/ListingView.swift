import SwiftUI
import CommonUI
import DomainKit

struct ListingView: View {

    @ObservedObject
    var presenter: ListingPresenter

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            content
        }
        .navigationTitle("Universities")
    }

    @ViewBuilder
    private var content: some View {

        switch presenter.state {

        case .idle:
            Color.clear
                .onAppear {
                    presenter.load()
                }

        case .loading:
            LoadingView()

        case .empty:
            EmptyStateView(
                title: "No Universities",
                message: "No data found."
            )

        case .error(let message):
            ErrorView(
                message: message,
                retryAction: {
                    presenter.retry()
                }
            )

        case .loaded(let universities):

            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(universities) { university in

                        Button {
                            presenter.didSelect(university)
                        } label: {
                            UniversityRow(
                                university: university
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
    }
}
