//
//  MealzStandaloneRecipeCardSwiftUI.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzStandaloneRecipeCardSwiftUI: UIViewControllerRepresentable {
    private let coordinator: StandaloneRecipeCardNavCoordinator
    
    private let recipeId: String?
    private let recipe: Recipe?
    private let criteria: SuggestionsCriteria?
    private let recipeDimensions: CGSize
    
    public init(
        recipeId: String? = nil,
        recipe: Recipe? = nil,
        criteria: SuggestionsCriteria? = nil,
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        if recipeId == nil && recipe == nil && criteria == nil {
            LogHandler.companion.error("You must pass in a recipeID, recipe, or criteria for the recipeCard")
        }
        let navController = UINavigationController()
        self.recipeId = recipeId
        self.recipe = recipe
        self.criteria = criteria
        self.coordinator = StandaloneRecipeCardNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            recipeCardConstructor: recipeCardConstructor
        )
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        if let criteria {
            coordinator.showRecipeCard(criteria: criteria)
        } else if let recipe {
            coordinator.showRecipeCard(recipe: recipe)
        } else if let recipeId {
            coordinator.showRecipeCard(recipeId: recipeId)
        }
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // make sure it has correct size
        uiViewController.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
}
