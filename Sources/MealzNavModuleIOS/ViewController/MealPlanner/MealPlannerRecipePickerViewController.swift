//
//  MealPlannerRecipePickerViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class MealPlannerRecipePickerViewController: UIViewController {
    private let indexOfRecipe: Int
    private let mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerRecipePickerNavCoordinator?
    
    public init(
        indexOfRecipe: Int,
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerRecipePickerNavCoordinator?
    ) {
        self.indexOfRecipe = indexOfRecipe
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { print("deinit: MealPlannerRecipePickerViewController") }
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
                        strongSelf.coordinator?.showRecipeDetails(recipeId: recipeId, isForMealPlanner: true)
                    },
                    onSelectRecipeForMealPlanner: { [weak self] _ in
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
            gridConfig: localRecipesListViewConfig,
            indexOfReplacedRecipe: indexOfRecipe)
            
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerRecipePicker<
        MealPlannerRecipePickerParameters,
        BasePageViewParameters
    >>?

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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(self.isMovingFromParent)
        {
            self.coordinator?.parent?.children.removeLast()
        }
        
    }
}
