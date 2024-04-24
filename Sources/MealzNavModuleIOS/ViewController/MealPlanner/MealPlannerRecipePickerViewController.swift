//
//  MealPlannerRecipePickerViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MealzIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class MealPlannerRecipePickerViewController: UIViewController {
    private let indexOfRecipe: Int
    private let mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerFeatureNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    public init(
        indexOfRecipe: Int,
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerFeatureNavCoordinator?,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    ) {
        self.indexOfRecipe = indexOfRecipe
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Your SwiftUI View
    var swiftUIView: MealPlannerRecipePicker<
        MealPlannerRecipePickerParameters,
        BasePageViewParameters
    > {
        return MealPlannerRecipePicker(
            params:
                MealPlannerRecipePickerParameters(
                    actions: MealPlannerRecipePickerActions(
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId, isForMealPlanner: true)
                    },
                    onSelectRecipeForMealPlanner: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.goBack()
                },
                    onOpenFiltersOptions: { [weak self] filtersInstance in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showFilters(filterInstance: filtersInstance)
                }),
                    viewOptions: mealPlannerRecipePickerViewOptions
                    ),
            baseViews: baseViews,
            gridConfig: self.coordinator?.catalogRecipesListGridConfig ?? CatalogRecipesListGridConfig(),
            indexOfReplacedRecipe: indexOfRecipe)
            
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecipePicker<
        MealPlannerRecipePickerParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("meal_planner_title", bundle: .mealzNavBundle, comment: "Title for the MEAL.PLANNER screen")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("return_button", bundle: .mealzNavBundle, comment: "Return Button"), style: .plain, target: nil, action: nil)
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
