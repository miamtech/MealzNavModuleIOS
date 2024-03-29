//
//  SponsorDetailsViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 03/10/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class SponsorDetailsViewController: UIViewController {
    private let sponsor: Sponsor
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealzBaseNavCoordinator?
    
    init(
        sponsor: Sponsor,
        baseViews: BasePageViewParameters,
        coordinator: MealzBaseNavCoordinator?
    ) {
        self.sponsor = sponsor
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    // Your SwiftUI View
    var swiftUIView: SponsorDetails<
        BasePageViewParameters
    > {
        return SponsorDetails.init(
            baseViews: baseViews,
            sponsor: sponsor
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<SponsorDetails<
        BasePageViewParameters>>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(sponsor.name)"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("return_button", bundle: .mealzNavBundle, comment: "Return Button"), style: .plain, target: nil, action: nil)
        // Initialize the hosting controller with your SwiftUI view
        hostingController = UIHostingController(rootView: swiftUIView)
        guard let hostingController = hostingController, let hcView = hostingController.view
        else { return }
        // Since hostingController is optional, using guard to safely unwrap its view
        hcView.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        view.addSubview(hcView)
        NSLayoutConstraint.activate([
            hcView.topAnchor.constraint(equalTo: view.topAnchor),
            hcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hcView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hcView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}
