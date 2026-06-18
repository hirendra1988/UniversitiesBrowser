import Foundation

public final class RefreshNotifier: @unchecked Sendable {

    public static let shared = RefreshNotifier()

    private init() {}

    public var onRefreshRequested: (() -> Void)?

    public func requestRefresh() {
        onRefreshRequested?()
    }
}
