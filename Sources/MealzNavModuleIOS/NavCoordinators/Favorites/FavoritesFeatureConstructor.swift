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
    let favoritesViewOptions: FavoritesViewOptions
    let navigateToCatalog: () -> Void
    
    public init(
        favoritesViewOptions: FavoritesViewOptions = FavoritesViewOptions(),
        navigateToCatalog: @escaping () -> Void
    ) {
        self.favoritesViewOptions = favoritesViewOptions
        self.navigateToCatalog = navigateToCatalog
    }
}
