import SwiftUI

public struct ErrorView: View {

    private let title: String
    private let message: String
    private let retryAction: () -> Void

    public init(
        title: String = "Something went wrong",
        message: String,
        retryAction: @escaping () -> Void
    ) {
        self.title = title
        self.message = message
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack(spacing: 16) {

            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.red)

            Text(title)
                .font(.title3)
                .bold()

            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            PrimaryButton(
                title: "Try Again",
                action: retryAction
            )
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
