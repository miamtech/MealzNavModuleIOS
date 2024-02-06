//
//  PreferencesViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 22/09/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class PreferencesViewController: UIViewController {
    private let preferencesViewOptions: PreferencesViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealzBaseNavCoordinator?
    
    init(
        preferencesViewOptions: PreferencesViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealzBaseNavCoordinator? = nil
    ) {
        self.preferencesViewOptions = preferencesViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // Your SwiftUI View
    var swiftUIView: Preferences<
        PreferencesParameters,
        BasePageViewParameters
    > {
        return Preferences.init(
            params: PreferencesParameters(
                actions: PreferencesActions(
                    onClosed: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.goBack()
                    },
                    onGoToSearch: { [weak self] in
                        guard let strongSelf = self else { return }
                        //                        strongSelf.coordinator?.showPreferencesSearch()
                    }
                ),
                viewOptions: preferencesViewOptions
            ),
            baseViews: baseViews
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<
        Preferences<PreferencesParameters,
                    BasePageViewParameters
        >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Preferences"
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
