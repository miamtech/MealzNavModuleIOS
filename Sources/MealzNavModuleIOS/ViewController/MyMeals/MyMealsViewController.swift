//
//  MyMealsViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 02/10/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class MyMealsViewController: UIViewController {
    private let myMealsViewOptions: MyMealsViewOptions
    private let baseViews: BasePageViewParameters
    private let gridConfig: CatalogRecipesListGridConfig
    private let navigateToTheCatalog: () -> Void
    weak var coordinator: MealzBaseNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        myMealsViewOptions: MyMealsViewOptions,
        baseViews: BasePageViewParameters,
        gridConfig: CatalogRecipesListGridConfig,
        coordinator: MealzBaseNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator,
        navigateToTheCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.gridConfig = gridConfig
        self.navigateToTheCatalog = navigateToTheCatalog
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    // Your SwiftUI View
    var swiftUIView: MyMeals<
        MyMealsParameters,
        BasePageViewParameters
    > {
        return MyMeals.init(
            params: MyMealsParameters(
                actions: MyMealsActions(
                    onNoResultsRedirect: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.navigateToTheCatalog()
                    }, onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    }
                ),
                viewOptions: myMealsViewOptions
            ),
            baseViews: baseViews,
            gridConfig: gridConfig
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MyMeals<
        MyMealsParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Meals"
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
