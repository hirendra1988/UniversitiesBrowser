import DomainKit

public enum ListingState: Equatable {
    case idle
    case loading
    case loaded([University])
    case empty
    case error(String)
}
