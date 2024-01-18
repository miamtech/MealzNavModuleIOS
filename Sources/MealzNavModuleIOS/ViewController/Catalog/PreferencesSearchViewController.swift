//
//  PreferencesSearchViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 28/09/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class PreferencesSearchViewController: UIViewController {
    private let preferencesSearchViewOptions: PreferencesSearchViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealzBaseNavCoordinator?
    
    init(
        preferencesSearchViewOptions: PreferencesSearchViewOptions,
        baseViews: BasePageViewParameters, 
        coordinator: MealzBaseNavCoordinator? = nil
    ) {
        self.preferencesSearchViewOptions = preferencesSearchViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinit: PreferencesSearchViewController") }
    // Your SwiftUI View
    var swiftUIView: PreferencesSearch<
        PreferencesSearchParameters,
        BasePageViewParameters
    > {
        return PreferencesSearch.init(
            params: PreferencesSearchParameters(
                onClosed: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.coordinator?.goBack()
                }, 
                viewOptions: preferencesSearchViewOptions
            ),
            baseViews: baseViews
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<PreferencesSearch<
        PreferencesSearchParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
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
