//
//  FavoritesFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct FavoritesFeatureConstructor {
    let baseViews: BasePageViewParameters
    let favoritesViewOptions: FavoritesViewOptions
    let navigateToCatalog: () -> Void
    
    // grid configs
    let catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        favoritesViewOptions: FavoritesViewOptions = FavoritesViewOptions(),
        catalogRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        navigateToCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.favoritesViewOptions = favoritesViewOptions
        self.catalogRecipesListGridConfig = catalogRecipesListGridConfig
        self.navigateToCatalog = navigateToCatalog
    }
}
