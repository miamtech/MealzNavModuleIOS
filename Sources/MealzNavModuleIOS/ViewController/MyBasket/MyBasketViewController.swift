//
//  MyBasketViewController.swift
//  
//
//  Created by Antonin Francois on 28/03/2024.
//

import UIKit
import SwiftUI
import MealzIOSFramework
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
class MyBasketViewController: UIViewController {
    private let myBasketViewOptions: MyBasketViewOptions
    private let myMealsViewOptions: MyMealsViewOptions
    private let myProductsViewOptions: MyProductsViewOptions
    private let myBasketBaseViews: BasePageViewParameters
    private let myMealsBaseViews: BasePageViewParameters
    private let myProductsBaseViews: BasePageViewParameters
    private let gridConfig: CatalogRecipesListGridConfig
    private let navigateToTheCatalog: () -> Void
    weak var coordinator: MealzBaseNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?

    init(
        myBasketViewOptions: MyBasketViewOptions,
        myBasketBaseViews: BasePageViewParameters,
        myMealsViewOptions: MyMealsViewOptions,
        myMealsBaseViews: BasePageViewParameters,
        myProductsViewOptions: MyProductsViewOptions,
        myProductsBaseViews: BasePageViewParameters,
        gridConfig: CatalogRecipesListGridConfig,
        coordinator: MealzBaseNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator,
        navigateToTheCatalog: @escaping () -> Void
    ) {
        self.myBasketViewOptions = myBasketViewOptions
        self.myBasketBaseViews = myBasketBaseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.myMealsBaseViews = myMealsBaseViews
        self.myProductsViewOptions = myProductsViewOptions
        self.myProductsBaseViews = myProductsBaseViews
        self.gridConfig = gridConfig
        self.navigateToTheCatalog = navigateToTheCatalog
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    // Your SwiftUI View
    var swiftUIView: MyBasket<
        MyBasketParameters,
        BasePageViewParameters,
        MyMealsParameters,
        BasePageViewParameters,
        MyProductsParameters,
        BasePageViewParameters
    > {
        return MyBasket.init(
            myBasketParams: MyBasketParameters(
                actions: MyBasketActions(onSubmitOrder: {}), 
                viewOptions: myBasketViewOptions
            ),
            myBasketBaseViews: myBasketBaseViews,
            myMealsParams: MyMealsParameters(
                actions: MyMealsActions(
                    onNoResultsRedirect: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.navigateToTheCatalog()
                    }, onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    }, openItemSelector: { [weak self] id in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showItemSelector(ingredientId: nil, basketEntryId: id)
                    }
                ),
                viewOptions: myMealsViewOptions
            ),
            myMealsBaseViews: myMealsBaseViews,
            myProductsParams: MyProductsParameters(
                viewOptions: myProductsViewOptions,
                actions: MyProductsActions(
                    onNoResultsRedirect: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.navigateToTheCatalog()
                    },
                    openItemSelector: { [weak self] basketEntryId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showItemSelector(ingredientId: nil, basketEntryId: basketEntryId)
                    }
                )
            ),
            myProductsBaseViews: myProductsBaseViews,
            gridConfig: gridConfig
        )
    }

    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<MyBasket<
        MyBasketParameters,
        BasePageViewParameters,
        MyMealsParameters,
        BasePageViewParameters,
        MyProductsParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("my_meals_title", bundle: .mealzNavBundle, comment: "Title for the MY.MEALS screen")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("return_button", bundle: .mealzNavBundle, comment: "Return Button"), style: .plain, target: nil, action: nil)
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
