import CoreData

extension NSManagedObjectContext {

    func performAsync<T: Sendable>(
        _ work: @Sendable @escaping () throws -> T
    ) async throws -> T {

        try await withCheckedThrowingContinuation { continuation in
            self.perform {
                do {
                    let result = try work()
                    continuation.resume(returning: result)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
