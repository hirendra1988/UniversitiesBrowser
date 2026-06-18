public enum PersistenceError: Error {
    case saveFailed(Error)
    case fetchFailed(Error)
    case deleteFailed(Error)
}
