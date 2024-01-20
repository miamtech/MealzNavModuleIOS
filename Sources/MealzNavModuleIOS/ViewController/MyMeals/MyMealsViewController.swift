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
var myMealsBasketViewConfig = BasketRecipesGridConfig(
    recipeSpacing: CGSize(width: 5, height: 5),
    productSpacing: CGSize(width: 6, height: 6),
    recipeOverviewDimensions: CGSize(width: 300, height: 180),
    isExpandable: true)

@available(iOS 14, *)
class MyMealsViewController: UIViewController {
    private let myMealsViewOptions: MyMealsViewOptions
    private let baseViews: BasePageViewParameters
    private let navigateToTheCatalog: () -> Void
    weak var coordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        myMealsViewOptions: MyMealsViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: RecipeDetailsFeatureNavCoordinator? = nil,
        navigateToTheCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.navigateToTheCatalog = navigateToTheCatalog
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinit: MyMealsViewController") }
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
                    strongSelf.coordinator?.showRecipeDetails(recipeId: recipeId)
                }
            ),
                viewOptions: myMealsViewOptions
                ),
            baseViews: baseViews,
            gridConfig: myMealsBasketViewConfig
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
