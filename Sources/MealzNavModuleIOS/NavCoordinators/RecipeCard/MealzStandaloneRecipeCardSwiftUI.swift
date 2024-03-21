//
//  MealzStandaloneRecipeCardSwiftUI.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzStandaloneRecipeCardSwiftUI: UIViewControllerRepresentable {
    private let coordinator: StandaloneRecipeCardNavCoordinator
    
    private let recipeId: String?
    private let recipe: Recipe?
    private let criteria: SuggestionsCriteria?
    private let recipeDimensions: CGSize
    
    public init(
        recipeId: String,
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.recipeId = recipeId
        self.recipe = nil
        self.criteria = nil
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.coordinator = Self.postInit(
            recipeCardConstructor:recipeCardConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor)
    }
    
    public init(
        recipe: Recipe,
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.recipeId = recipe.id
        self.recipe = recipe
        self.criteria = nil
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.coordinator = Self.postInit(
            recipeCardConstructor:recipeCardConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor)
    }
    
    public init(
        criteria: SuggestionsCriteria,
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.recipeId = nil
        self.recipe = nil
        self.criteria = criteria
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.coordinator = Self.postInit(
            recipeCardConstructor:recipeCardConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor)
    }
    
    private static func postInit(
        recipeCardConstructor: StandaloneRecipeCardConstructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    ) -> StandaloneRecipeCardNavCoordinator {
        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        return StandaloneRecipeCardNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            recipeCardConstructor: recipeCardConstructor
        )
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        if let criteria {
            coordinator.showRecipeCard(criteria: criteria)
        } else if let recipe {
            coordinator.showRecipeCard(recipe: recipe)
        } else if let recipeId {
            coordinator.showRecipeCard(recipeId: recipeId)
        }
        if let recipeCardViewController = coordinator.navigationController.viewControllers.first {
            return recipeCardViewController
        }
        return UIViewController() //Use to prevent crash in case where recipecard cannot be created
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // make sure it has correct size
        uiViewController.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
}
