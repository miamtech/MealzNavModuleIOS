//
//  MealViewController.swift
//  SampleUIKitIntegration
//
//  Created by Vincent Kergonna on 12/07/2022.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class MealPlannerFormViewController: UIViewController {
    private let mealPlannerFormViewOptions: MealPlannerFormViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerFeatureNavCoordinator?
    
    public init(
        mealPlannerFormViewOptions: MealPlannerFormViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerFeatureNavCoordinator?
    ) {
        self.mealPlannerFormViewOptions = mealPlannerFormViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Your SwiftUI View
    var swiftUIView: MealPlannerForm<
        MealPlannerFormParameters,
        BasePageViewParameters
    > {
        return MealPlannerForm(
            params: MealPlannerFormParameters(
                actions: MealPlannerFormActions(
                    onNavigateToMealPlannerResults: { [weak self] recipes in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showMealPlannerResults()
                    }),
                viewOptions: mealPlannerFormViewOptions
            ),
            baseViews: baseViews
        )
        
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerForm<
        MealPlannerFormParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("meal_planner_title", bundle: .mealzNavBundle, comment: "Title for the MEAL.PLANNER screen")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Mon assistant budget repas", style: .plain, target: nil, action: nil)
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
