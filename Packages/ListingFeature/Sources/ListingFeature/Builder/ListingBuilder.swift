import UIKit
import NetworkKit
import PersistenceKit

public enum ListingBuilder {

    @MainActor
    public static func build() -> UIViewController {

        // Services
        let api = UniversitiesAPIService()

        // Local store
        let store = CoreDataUniversityStore()

        // Repository
        let repository = DefaultUniversityRepository(
            api: api,
            store: store
        )

        // VIPER
        let interactor = ListingInteractor(
            repository: repository
        )

        let router = ListingRouter()

        let presenter = ListingPresenter(
            interactor: interactor,
            router: router
        )

        let viewController = ListingViewController(
            presenter: presenter
        )

        router.viewController = viewController

        return viewController
    }
}
