//
//  CatalogViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 08/08/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
// simple function to share navigation between CatalogView & CatalogResultsView
public func sharedCatalogViewParams(
    catalogViewOptions: CatalogViewOptions,
    coordinator: CatalogFeatureNavCoordinator?
) -> CatalogParameters {
    return CatalogParameters(
        onFiltersTapped: { filterInstance in
            coordinator?.showFilters(filterInstance: filterInstance)
        },
        onSearchTapped: { filterInstance in
            coordinator?.showCatalogSearch(filterInstance: filterInstance)
        },
        onFavoritesTapped: {
            coordinator?.showCatalogResults()
        },
        onPreferencesTapped: {
            coordinator?.showPreferences()
        },
        onLaunchMealPlanner: {
//            coordinator?.launchMealPlanner()
        },
        onMealsInBasketButtonTapped: {
            coordinator?.showMyMeals()
        },
        viewOptions: catalogViewOptions
    )
}

@available(iOS 14, *)
public class CatalogViewController: UIViewController {
    private let catalogViewOptions: CatalogViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: CatalogFeatureNavCoordinator?
    
    public init(
        catalogViewOptions: CatalogViewOptions,
        baseViews: BasePageViewParameters, 
        coordinator: CatalogFeatureNavCoordinator
    ) {
        self.catalogViewOptions = catalogViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit { print("deinit: CatalogViewController") }
    // Your SwiftUI View
    var swiftUIView: CatalogView<
        CatalogParameters,
        CatalogPackageRowParameters,
        BasePageViewParameters
    > {
            return CatalogView.init(
                params: sharedCatalogViewParams(
                    catalogViewOptions: catalogViewOptions,
                    coordinator: coordinator
                ),
                catalogPackageRowParams: CatalogPackageRowParameters(
                    onSeeAllRecipes: { [weak self] categoryId, categoryTitle in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showCatalogResults(
                            catalogId: categoryId,
                            categoryTitle: categoryTitle
                        )
                    },
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showRecipeDetails(recipeId: recipeId)
                    }, onRecipeCallToActionTapped: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showMyMeals()
                    }
                ),
                baseViews: baseViews,
                gridConfig: localRecipesListViewConfig
            )
        }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CatalogView<
        CatalogParameters,
        CatalogPackageRowParameters,
        BasePageViewParameters
    >>?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Catalog"
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
