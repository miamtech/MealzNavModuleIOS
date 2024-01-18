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
    private let navigateToTheCatalog: () -> Void
    weak var coordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        favoritesViewOptions: FavoritesViewOptions,
        baseViews: BasePageViewParameters, 
        navigateToTheCatalog: @escaping () -> Void,
        coordinator: RecipeDetailsFeatureNavCoordinator?
    ) {
        self.favoritesViewOptions = favoritesViewOptions
        self.baseViews = baseViews
        self.navigateToTheCatalog = navigateToTheCatalog
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinit: FavoritesViewController") }
    // Your SwiftUI View
    var swiftUIView: Favorites<
        FavoritesParameters,
        BasePageViewParameters
    > {
        return Favorites.init(
            params: FavoritesParameters(
                onNoResultsRedirect: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.navigateToTheCatalog()
                },
                onShowRecipeDetails: { [weak self] recipeId in
                    guard let strongSelf = self else { return }
                    strongSelf.coordinator?.showRecipeDetails(recipeId: recipeId)
                }, onRecipeCallToActionTapped: { [weak self] recipeId in
                    guard let strongSelf = self else { return }
//                    strongSelf.coordinator?.showMyMeals()
                },
                viewOptions: favoritesViewOptions
            ),
            baseViews: baseViews,
            gridConfig: localRecipesListViewConfig
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<Favorites<
        FavoritesParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
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
