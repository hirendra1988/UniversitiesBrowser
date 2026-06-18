import UIKit
import SwiftUI

final class ListingViewController: UIViewController {

    private let presenter: ListingPresenter

    init(presenter: ListingPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Universities"

        let host = UIHostingController(
            rootView: ListingView(
                presenter: presenter
            )
        )

        addChild(host)

        host.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(host.view)

        NSLayoutConstraint.activate([
            host.view.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            host.view.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            host.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            host.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            )
        ])

        host.didMove(toParent: self)
    }
}
