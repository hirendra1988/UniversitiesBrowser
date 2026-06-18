import UIKit
import DomainKit
import DetailsFeature

@MainActor
protocol ListingRouterProtocol: AnyObject {
    func showDetails(
        for university: University,
        onRefresh: @escaping () -> Void
    )
}

@MainActor
final class ListingRouter: ListingRouterProtocol {

    weak var viewController: UIViewController?

    func showDetails(
        for university: University,
        onRefresh: @escaping () -> Void
    ) {
        let detailsVC = DetailsBuilder.build(
            university: university,
            onRefresh: onRefresh
        )

        viewController?.navigationController?.pushViewController(
            detailsVC,
            animated: true
        )
    }
}
