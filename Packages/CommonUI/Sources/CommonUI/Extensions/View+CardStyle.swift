import SwiftUI

public extension View {

    func commonCardStyle() -> some View {
        self
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
    }
}
