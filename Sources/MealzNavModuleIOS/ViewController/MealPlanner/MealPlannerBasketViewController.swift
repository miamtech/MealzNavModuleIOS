//
//  MealPlannerBasketViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
public var localBasketGridConfig = BasketRecipesGridConfig(
    recipeSpacing: CGSize(width: 5, height: 5),
    productSpacing: CGSize(width: 6, height: 6),
    recipeOverviewDimensions: CGSize(width: 300, height: 150),
    isExpandable: true)

@available(iOS 14, *)
class MealPlannerBasketViewController: UIViewController {
    private let mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    private let basketRecipeViewOptions: BasketRecipeViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealPlannerBasketNavCoordinator?
    
    public init(
        mealPlannerBasketViewOptions: MealPlannerBasketViewOptions,
        basketRecipeViewOptions: BasketRecipeViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealPlannerBasketNavCoordinator?
    ) {
        self.mealPlannerBasketViewOptions = mealPlannerBasketViewOptions
        self.basketRecipeViewOptions = basketRecipeViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { print("deinit: MealPlannerBasketViewController") }
    // Your SwiftUI View
    var swiftUIView: MealPlannerBasket<
        MealPlannerBasketParameters,
        BasketRecipeParameters,
        BasePageViewParameters
    > {
        return MealPlannerBasket(
            params: MealPlannerBasketParameters(
                actions: MealPlannerBasketActions(
                    onNavigateToRecap: { [weak self] in
                        guard let strongSelf = self else { return }
                         strongSelf.coordinator?.showMealPlannerRecap()
                    },
                    onNavigateToBasket: { [weak self] in }),
                viewOptions: mealPlannerBasketViewOptions
            ),
            basketRecipesParams: BasketRecipeParameters(
                actions: BasketRecipeActions(
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showRecipeDetails(recipeId: recipeId, isForMealPlanner: true)
                    }, onReplaceProduct: { [weak self] ingredientId in
                        guard let strongSelf = self else { return }
//todo                        strongSelf.coordinator?.showItemSelector(ingredientId: ingredientId)
                    }),
                viewOptions: basketRecipeViewOptions
            ),
            baseViews: baseViews,
            gridConfig: localBasketGridConfig
        )
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MealPlannerBasket<
        MealPlannerBasketParameters,
        BasketRecipeParameters,
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(self.isMovingFromParent)
        {
            self.coordinator?.parent?.children.removeLast()
        }
        
    }
}
