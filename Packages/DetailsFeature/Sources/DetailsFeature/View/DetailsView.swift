import SwiftUI
import CommonUI

struct DetailsView: View {

    @ObservedObject var presenter: DetailsPresenter

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(spacing: 20) {

                // MARK: Header

                VStack(spacing: 12) {

                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.15))
                            .frame(width: 80, height: 80)

                        Image(systemName: "building.columns.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.blue)
                    }

                    Text(presenter.state.university.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text(presenter.state.university.country)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)

                // MARK: Information Card

                VStack(alignment: .leading, spacing: 16) {

                    DetailRow(
                        icon: "globe",
                        title: "Country",
                        value: presenter.state.university.country
                    )

                    if let state = presenter.state.university.stateProvince,
                       !state.isEmpty {

                        Divider()

                        DetailRow(
                            icon: "location.fill",
                            title: "State / Province",
                            value: state
                        )
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // MARK: Domains

                VStack(alignment: .leading, spacing: 12) {

                    Label("Domains", systemImage: "network")
                        .font(.headline)

                    ForEach(
                        presenter.state.university.domains,
                        id: \.self
                    ) { domain in

                        Text(domain)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(12)
                            .background(Color(.tertiarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // MARK: Web Pages

                VStack(alignment: .leading, spacing: 12) {

                    Label("Web Pages", systemImage: "link")

                        .font(.headline)

                    ForEach(
                        presenter.state.university.webPages,
                        id: \.self
                    ) { page in

                        Link(destination: URL(string: page)!) {
                            HStack {

                                Text(page)
                                    .lineLimit(2)

                                Spacer()

                                Image(systemName: "arrow.up.right.square")
                            }
                            .padding(12)
                            .background(Color(.tertiarySystemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                // MARK: Refresh Button

                PrimaryButton(
                    title: "Refresh",
                    isLoading: presenter.isRefreshing
                ) {
                    presenter.refreshTapped()
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct DetailRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(alignment: .top, spacing: 12) {

            Image(systemName: icon)
                .foregroundStyle(.blue)
                .frame(width: 24)

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(value)
                    .font(.body)
                    .foregroundStyle(.primary)
            }

            Spacer()
        }
    }
}
