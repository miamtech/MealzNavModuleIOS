//
//  RecapPurchaseViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class MealPlannerRecapPurchaseViewController: UIViewController {
    private let mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerFeatureNavCoordinator?
    
    public init(
        mealPlannerRecapViewOptions: MealPlannerRecapViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerFeatureNavCoordinator?
    ) {
        self.mealPlannerRecapViewOptions = mealPlannerRecapViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var swiftUIView: MealPlannerRecap<MealPlannerRecapParameters> {
        return MealPlannerRecap(
            params: MealPlannerRecapParameters(
                actions: MealPlannerRecapActions(
                    onNavigateAwayFromMealPlanner: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.goBack()
                    }
                ),
                viewOptions: mealPlannerRecapViewOptions
            ))
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecap<MealPlannerRecapParameters>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
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
