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

@available(iOS 14, *)
public class FavoritesFeatureNavCoordinator: MealzBaseNavCoordinator, FavoritesFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var favoritesViewOptions: FavoritesViewOptions
    public var navigateToCatalog: () -> Void
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
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
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        self.catalogRecipesListGridConfig = favoritesFeatureConstructor.catalogRecipesListGridConfig
        super.init(constructor: baseConstructor)
        setFavorites()
    }
    
    public func setFavorites() {
        let favoritesVC = FavoritesViewController(
            favoritesViewOptions: favoritesViewOptions,
            baseViews: baseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.viewControllers = [favoritesVC]
    }
}
