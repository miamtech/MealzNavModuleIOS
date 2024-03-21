//
//  MealzFavoritesFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzFavoritesFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: FavoritesFeatureNavCoordinator
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        favoritesFeatureConstructor: FavoritesFeatureConstructor
    ) {
        let navController = UINavigationController()
        
        self.coordinator = FavoritesFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            favoritesFeatureConstructor: favoritesFeatureConstructor
        )
        coordinator.setFavorites()
        // Hide the navigation bar
        navController.isNavigationBarHidden = hideTitles
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
