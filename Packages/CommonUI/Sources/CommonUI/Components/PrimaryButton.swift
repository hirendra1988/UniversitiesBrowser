import SwiftUI

public struct PrimaryButton: View {

    private let title: String
    private let isLoading: Bool
    private let action: () -> Void

    public init(
        title: String,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                } else {
                    Text(title)
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
        }
        .buttonStyle(.borderedProminent)
        .disabled(isLoading)
    }
}
