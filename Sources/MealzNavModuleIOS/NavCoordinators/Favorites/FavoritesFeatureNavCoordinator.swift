//
//  FavoritesFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class FavoritesFeatureNavCoordinator: MealzBaseNavCoordinator, FavoritesFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var favoritesViewOptions: FavoritesViewOptions
    public var navigateToCatalog: () -> Void
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        favoritesFeatureConstructor: FavoritesFeatureConstructor
    ) {
        self.baseViews = favoritesFeatureConstructor.baseViews
        self.favoritesViewOptions = favoritesFeatureConstructor.favoritesViewOptions
        self.navigateToCatalog = favoritesFeatureConstructor.navigateToCatalog
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
    }
    
    public func showFavorites() {
        let favoritesVC = FavoritesViewController(
            favoritesViewOptions: favoritesViewOptions,
            baseViews: baseViews,
            coordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.pushViewController(favoritesVC, animated: false)
    }
}
