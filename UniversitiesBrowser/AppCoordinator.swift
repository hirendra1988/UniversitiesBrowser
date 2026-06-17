import UIKit
import ListingFeature

final class AppCoordinator {

    let navigationController = UINavigationController()

    func start() -> UIViewController {
        let listingVC = ListingBuilder.build()
        navigationController.viewControllers = [listingVC]
        return navigationController
    }
}
