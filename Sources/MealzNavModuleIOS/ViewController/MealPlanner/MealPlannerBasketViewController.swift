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
    deinit { print("deinit: MealPlannerBasketViewController") }
    // Your SwiftUI View
    var swiftUIView: MealPlannerBasket<
        MealPlannerBasketParameters,
        BasketRecipeParameters,
        BasePageViewParameters
    > {
        return MealPlannerBasket(
            params: MealPlannerBasketParameters(
                onNavigateToRecap: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.navigationController?.pushViewController(MealPlannerRecapPurchaseViewController(), animated: true)
                },
                onNavigateToBasket: { [weak self] in }),
            basketRecipesParams: BasketRecipeParameters(
                onReplaceProduct: { [weak self] ingredientId in
                    guard let strongSelf = self else { return }
//                    strongS elf.navigationController?.pushViewController(ItemSelectorViewController(ingredientId: ingredientId), animated: true)
                },
                onShowRecipeDetails: { [weak self] recipeId in
                    guard let strongSelf = self else { return }
//                    strongSelf.navigationController?.pushViewController(RecipeDetailsViewController(recipeId), animated: true)
                }),
            baseViews: BasePageViewParameters(),
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
}
