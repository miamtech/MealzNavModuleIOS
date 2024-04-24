//
//  FavoritesFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MealzIOSFramework

@available(iOS 14, *)
public protocol FavoritesFeatureNavCoordinatorProtocol {
    var baseViews: BasePageViewParameters { get set }
    var favoritesViewOptions: FavoritesViewOptions { get set }
    var navigateToCatalog: () -> Void { get set }
    
    // grid configs
    var catalogRecipesListGridConfig: CatalogRecipesListGridConfig { get set }
    
    func setFavorites()
}
