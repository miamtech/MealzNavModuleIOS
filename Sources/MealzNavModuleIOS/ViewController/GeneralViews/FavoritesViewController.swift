//
//  FavoritesViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 25/09/2023.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class FavoritesViewController: UIViewController {
    public let favoritesViewOptions: FavoritesViewOptions
    private let baseViews: BasePageViewParameters
    private let gridConfig: CatalogRecipesListGridConfig
    private let navigateToTheCatalog: () -> Void
    weak var coordinator: FavoritesFeatureNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        favoritesViewOptions: FavoritesViewOptions,
        baseViews: BasePageViewParameters, 
        gridConfig: CatalogRecipesListGridConfig,
        coordinator: FavoritesFeatureNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator,
        navigateToTheCatalog: @escaping () -> Void
    ) {
        self.favoritesViewOptions = favoritesViewOptions
        self.baseViews = baseViews
        self.gridConfig = gridConfig
        self.navigateToTheCatalog = navigateToTheCatalog
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // Your SwiftUI View
    var swiftUIView: Favorites<
        FavoritesParameters,
        BasePageViewParameters
    > {
        return Favorites.init(
            params: FavoritesParameters(
                actions: FavoritesActions(
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    },
                    onNoResultsRedirect: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.navigateToTheCatalog()
                    },
                    onRecipeCallToActionTapped: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.recipeDetailsCoordinator?.showRecipeDetails(recipeId: recipeId)
                    }
                ),
                viewOptions: favoritesViewOptions
            ),
            baseViews: baseViews,
            gridConfig: gridConfig
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<Favorites<
        FavoritesParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("FAVORITES.TITLE", bundle: .mealzNavBundle, comment: "Title for the FAVORITES screen")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("RETURN.BUTTON", bundle: .mealzNavBundle, comment: "Return Button"), style: .plain, target: nil, action: nil)
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
