//
//  MealzFavoritesFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzFavoritesFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: FavoritesFeatureNavCoordinator
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        favoritesViewOptions: FavoritesViewOptions = FavoritesViewOptions(),
        navigateToCatalog: @escaping () -> Void
    ) {
        let navController = UINavigationController()
        
        self.coordinator = FavoritesFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController,
                baseViews: baseViews
            ),
            recipeDetailsConstructor: RecipeDetailsFeatureConstructor(
                recipeDetailsViewOptions: recipeDetailsConstructor.recipeDetailsViewOptions,
                recipeDetailsProductViewOptions: recipeDetailsConstructor.recipeDetailsProductViewOptions,
                itemSelectorViewOptions: recipeDetailsConstructor.itemSelectorViewOptions
            ),
            favoritesFeatureConstructor: FavoritesFeatureConstructor(
                favoritesViewOptions: favoritesViewOptions,
                navigateToCatalog: navigateToCatalog)
        )
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.showFavorites()
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
