import DomainKit

protocol DetailsInteractorProtocol {
    func university() -> University
}

final class DetailsInteractor: DetailsInteractorProtocol {

    private let universityModel: University

    init(university: University) {
        self.universityModel = university
    }

    func university() -> University {
        universityModel
    }
}
