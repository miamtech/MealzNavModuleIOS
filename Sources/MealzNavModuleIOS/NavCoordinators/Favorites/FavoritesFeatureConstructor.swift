//
//  FavoritesFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS

@available(iOS 14, *)
public struct FavoritesFeatureConstructor {
    let baseViews: BasePageViewParameters
    let favoritesViewOptions: FavoritesViewOptions
    let navigateToCatalog: () -> Void
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        favoritesViewOptions: FavoritesViewOptions = FavoritesViewOptions(),
        navigateToCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.favoritesViewOptions = favoritesViewOptions
        self.navigateToCatalog = navigateToCatalog
    }
}
