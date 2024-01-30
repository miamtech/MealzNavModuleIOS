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
    private let catalogViewOptions: CatalogViewOptions
    private let recipesListViewOptions: CatalogRecipesListViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: CatalogFeatureNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        categoryId: String? = nil,
        categoryTitle: String? = nil,
        catalogViewOptions: CatalogViewOptions,
        recipesListViewOptions: CatalogRecipesListViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: CatalogFeatureNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    ) {
        self.categoryId = categoryId
        self.categoryTitle = categoryTitle
        self.catalogViewOptions = catalogViewOptions
        self.recipesListViewOptions = recipesListViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit { print("deinit: CatalogResultsViewController") }
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
            gridConfig: self.coordinator?.catalogRecipesListGridConfig ?? CatalogRecipesListGridConfig()
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
        navigationItem.title = "Results"
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
