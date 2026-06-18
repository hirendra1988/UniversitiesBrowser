import SwiftUI

public struct LoadingView: View {

    public init() {}

    public var body: some View {
        VStack(spacing: 12) {
            ProgressView()
            Text("Loading...")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
