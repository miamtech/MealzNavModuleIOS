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
public class FavoritesFeatureNavCoordinator: RecipeDetailsFeatureNavCoordinator, FavoritesFeatureNavCoordinatorProtocol {
    public var favoritesViewOptions: FavoritesViewOptions
    public var navigateToCatalog: () -> Void
    
    init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        favoritesFeatureConstructor: FavoritesFeatureConstructor
    ) {
        self.favoritesViewOptions = favoritesFeatureConstructor.favoritesViewOptions
        self.navigateToCatalog = favoritesFeatureConstructor.navigateToCatalog
        super.init(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor
        )
    }
    
    public func showFavorites() {
        let favoritesVC = FavoritesViewController(
            favoritesViewOptions: favoritesViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(favoritesVC, animated: false)
    }
}
