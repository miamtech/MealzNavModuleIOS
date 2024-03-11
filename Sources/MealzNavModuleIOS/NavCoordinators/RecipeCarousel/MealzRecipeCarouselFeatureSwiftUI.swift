//
//  MealzRecipeCarouselFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzRecipeCarouselFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: RecipeCarouselFeatureNavCoordinator
    
    private let productId: String?
    private let criteria: SuggestionsCriteria?
    private let numberOfResults: Int
    
    public init(
        productId: String,
        numberOfResults: Int,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor = RecipeCarouselFeatureConstructor()
    ) {
        self.productId = productId
        self.criteria = nil
        self.numberOfResults = numberOfResults
        self.coordinator = Self.postInit(
            recipeCarouselFeatureConstructor: recipeCarouselFeatureConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor)
    }
    
    public init(
        criteria: SuggestionsCriteria,
        numberOfResults: Int,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor = RecipeCarouselFeatureConstructor()
    ) {
        self.productId = nil
        self.criteria = criteria
        self.numberOfResults = numberOfResults
        self.coordinator = Self.postInit(
            recipeCarouselFeatureConstructor: recipeCarouselFeatureConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor)
    }
    
    private static func postInit(
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    ) -> RecipeCarouselFeatureNavCoordinator {
        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        return RecipeCarouselFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            recipeCarouselFeatureConstructor: recipeCarouselFeatureConstructor
        )
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        if let criteria {
            coordinator.setRecipeCarousel(criteria: criteria, numberOfResults: numberOfResults)
        } else if let productId {
            coordinator.setRecipeCarousel(productId: productId, numberOfResults: numberOfResults)
        }
        if let recipeCarpuselViewController = coordinator.navigationController.viewControllers.first {
            return recipeCarpuselViewController
        }
        return UIViewController() //Use to prevent crash in case where recipecard cannot be created
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // make sure it has correct size
//        uiViewController.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
}
