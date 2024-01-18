//
//  FavoritesFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import SwiftUI
import MealzUIModuleIOS

@available(iOS 14, *)
public protocol FavoritesFeatureNavCoordinatorProtocol {
    var favoritesViewOptions: FavoritesViewOptions { get set }
    var navigateToCatalog: () -> Void { get set }
    
    func showFavorites()
}
