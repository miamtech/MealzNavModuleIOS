//
//  MealzRecipeDetailsFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 04/04/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzRecipeDetailsFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: RecipeDetailsFeatureNavCoordinator
    
    private let recipeId: String?
    
    public init(
        hideTitles: Bool = false,
        recipeId: String,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.recipeId = recipeId
        let navController = UINavigationController()
        navController.isNavigationBarHidden = hideTitles
        self.coordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsFeatureConstructor: recipeDetailsConstructor
        )
        coordinator.setRecipeDetails(recipeId: recipeId)
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
