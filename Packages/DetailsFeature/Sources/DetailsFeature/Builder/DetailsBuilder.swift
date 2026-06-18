import UIKit
import DomainKit

public enum DetailsBuilder {

    @MainActor public static func build(
        university: University,
        onRefresh: (() -> Void)? = nil
    ) -> UIViewController {

        let presenter = DetailsPresenter(
            university: university
        )

        presenter.onRefresh = onRefresh

        return DetailsViewController(
            presenter: presenter
        )
    }
}
