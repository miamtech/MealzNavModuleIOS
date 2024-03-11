//
//  CatalogResultsViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 21/09/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class CatalogResultsViewController: UIViewController {
    private let categoryId: String?
    private let categoryTitle: String?
    private let isFavorite: Bool
    private let catalogViewOptions: CatalogViewOptions
    private let recipesListViewOptions: CatalogRecipesListViewOptions
    private let baseViews: BasePageViewParameters
    private let catalogResultsGridConfig: CatalogRecipesListGridConfig
    weak var coordinator: CatalogFeatureNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        title: String = NSLocalizedString("catalog_results_title", bundle: .mealzNavBundle, comment: "Title for the catalog screen"),
        categoryId: String? = nil,
        categoryTitle: String? = nil,
        isFavorite: Bool,
        catalogViewOptions: CatalogViewOptions,
        recipesListViewOptions: CatalogRecipesListViewOptions,
        baseViews: BasePageViewParameters,
        catalogResultsGridConfig: CatalogRecipesListGridConfig,
        coordinator: CatalogFeatureNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    ) {
        self.categoryId = categoryId
        self.categoryTitle = categoryTitle
        self.catalogViewOptions = catalogViewOptions
        self.isFavorite = isFavorite
        self.recipesListViewOptions = recipesListViewOptions
        self.baseViews = baseViews
        self.catalogResultsGridConfig = catalogResultsGridConfig
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Your SwiftUI View
    var swiftUIView: CatalogResults<
        CatalogParameters,
        CatalogRecipesListParameters,
        BasePageViewParameters
    > {
        return CatalogResults(
            params: CatalogParameters(
                actions: sharedCatalogActions(
                    coordinator: coordinator),
                viewOptions: catalogViewOptions
            ),
            recipesListParams: CatalogRecipesListParameters(
                actions: CatalogRecipesListActions(
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    }, onNoResultsRedirect: { [weak self] in },
                    onRecipeCallToActionTapped: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    }
                ),
                viewOptions: recipesListViewOptions
            ),
            baseViews: baseViews,
            categoryId: categoryId,
                title: categoryTitle,
            gridConfig: catalogResultsGridConfig,
            isFavorite: isFavorite
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CatalogResults<
        CatalogParameters,
        CatalogRecipesListParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
