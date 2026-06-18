import SwiftUI

public struct EmptyStateView: View {

    private let title: String
    private let message: String

    public init(
        title: String,
        message: String
    ) {
        self.title = title
        self.message = message
    }

    public var body: some View {

        VStack(spacing: 12) {

            Image(systemName: "tray")
                .font(.system(size: 40))

            Text(title)
                .font(.headline)

            Text(message)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
