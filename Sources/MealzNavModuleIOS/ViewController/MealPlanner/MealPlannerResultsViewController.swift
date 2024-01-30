//
//  MealPlannerResultsViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class MealPlannerResultsViewController: UIViewController {
    private let mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerFeatureNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    public init(
        mealPlannerResultsViewOptions: MealPlannerResultsViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerFeatureNavCoordinator?,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    ) {
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { print("deinit: MealPlannerResultsViewController") }
    // Your SwiftUI View
    var swiftUIView: MealPlannerResults<
        MealPlannerResultsParameters,
        BasePageViewParameters
    > {
        return MealPlannerResults(
            params:
                MealPlannerResultsParameters(
                    actions: MealPlannerResultsActions(
                        onShowRecipeDetails: { [weak self] recipeId in
                            guard let strongSelf = self else { return }
                            strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId, isForMealPlanner: true)
                        },
                        onOpenReplaceRecipe: { [weak self] indexOfRecipe in
                            guard let strongSelf = self else { return }
                            strongSelf.coordinator?.showMealPlannerRecipePicker(indexOfRecipe: indexOfRecipe)
                        },
                        onNavigateToBasket: {[weak self] in
                            guard let strongSelf = self else { return }
                            strongSelf.coordinator?.showMealPlannerBasket()
                        }),
                    viewOptions: mealPlannerResultsViewOptions
                ),
            baseViews: baseViews,
            gridConfig: MealPlannerRecipesListGridConfig(
                spacing: CGSize(width: 0, height: 0),
                recipeCardDimensions: CGSize(width: 300, height: 240)))
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerResults<
        MealPlannerResultsParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
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
