import UIKit
import SwiftUI

final class DetailsViewController: UIViewController {

    private let presenter: DetailsPresenter

    init(presenter: DetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"

        let host = UIHostingController(
            rootView: DetailsView(
                presenter: presenter
            )
        )

        addChild(host)

        host.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(host.view)

        NSLayoutConstraint.activate([
            host.view.topAnchor.constraint(equalTo: view.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            host.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        host.didMove(toParent: self)
    }
}
