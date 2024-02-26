//
//  StandaloneRecipeCardNavCoordinator.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework
import UIKit

@available(iOS 14, *)
public class StandaloneRecipeCardNavCoordinator: MealzBaseNavCoordinator, StandaloneRecipeCardNavCoordinatorProtocol {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var recipeCardDimensions: CGSize
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        let recipeDetailsNavController = UINavigationController()
        self.recipeCard = recipeCardConstructor.recipeCard
        self.recipeCardLoading = recipeCardConstructor.recipeCardLoading
        self.recipeCardDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeDetailsConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
    }
    
    public func showRecipeCard(
        recipeId: String
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            recipeId: recipeId,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    public func showRecipeCard(
        recipe: Recipe
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            recipe: recipe,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    public func showRecipeCard(
        criteria: SuggestionsCriteria
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            criteria: criteria,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    // for using a modal (used on Recipe Card)
    public func presentRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        recipeDetailsView.modalPresentationStyle = .fullScreen
        navigationController.present(recipeDetailsView, animated: true)
        recipeDetailsView.showRecipeDetails(recipeId: recipeId)
    }
}
