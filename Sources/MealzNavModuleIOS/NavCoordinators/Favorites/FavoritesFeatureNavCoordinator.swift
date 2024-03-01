//
//  FavoritesFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework
import UIKit

@available(iOS 14, *)
public class FavoritesFeatureNavCoordinator: MealzBaseNavCoordinator, FavoritesFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var favoritesViewOptions: FavoritesViewOptions
    public var navigateToCatalog: () -> Void
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit
    
    // grid configs
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        favoritesFeatureConstructor: FavoritesFeatureConstructor
    ) {
        self.baseViews = favoritesFeatureConstructor.baseViews
        self.favoritesViewOptions = favoritesFeatureConstructor.favoritesViewOptions
        self.navigateToCatalog = favoritesFeatureConstructor.navigateToCatalog
        let recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        self.catalogRecipesListGridConfig = favoritesFeatureConstructor.catalogRecipesListGridConfig
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeDetailsConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
    }
    
    // only used when navigation controller is from a Mealz UIKit or SwiftUI standalone
    internal func setFavorites() {
        let favoritesVC = FavoritesViewController(
            favoritesViewOptions: favoritesViewOptions,
            baseViews: baseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            navigateToTheCatalog: navigateToCatalog,
            showRecipeDetails: presentRecipeDetails
        )
        navigationController.viewControllers = [favoritesVC]
    }
    
    public func showFavorites() {
        let favoritesVC = FavoritesViewController(
            favoritesViewOptions: favoritesViewOptions,
            baseViews: baseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            navigateToTheCatalog: navigateToCatalog,
            showRecipeDetails: presentRecipeDetails
        )
        navigationController.pushViewController(favoritesVC, animated: false)
    }
    
    // for using a modal (used on Recipe Card)
    public func presentRecipeDetails(
        recipeId: String
    ) {
        navigationController.present(recipeDetailsView, animated: true)
        recipeDetailsView.showRecipeDetails(recipeId: recipeId)
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
        recipeDetailsView.navigationBar.topItem?.rightBarButtonItem = closeButton
    }
    
    @objc func closeTapped() {
        // Dismiss the navigation controller
        navigationController.dismiss(animated: true, completion: nil)
    }
}
