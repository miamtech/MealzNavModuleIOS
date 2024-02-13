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

@available(iOS 14, *)
public class StandaloneRecipeCardNavCoordinator: MealzBaseNavCoordinator, StandaloneRecipeCardNavCoordinatorProtocol {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var recipeCardDimensions: CGSize
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeCard = recipeCardConstructor.recipeCard
        self.recipeCardLoading = recipeCardConstructor.recipeCardLoading
        self.recipeCardDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
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
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator
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
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator
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
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
}
