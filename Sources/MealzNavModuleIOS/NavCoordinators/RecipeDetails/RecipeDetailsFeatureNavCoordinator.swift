//
//  RecipeDetailsFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//


import Foundation
import MealzUIModuleIOS
import UIKit
import mealzcore

@available(iOS 14, *)
public class RecipeDetailsFeatureNavCoordinator: MealzBaseNavCoordinator, RecipeDetailsNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var recipeDetailsViewOptions: RecipeDetailsViewOptions
    public var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
    public var itemSelectorViewOptions: ItemSelectorViewOptions

    public init(
        baseConstructor: Constructor,
        recipeDetailsFeatureConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.baseViews = recipeDetailsFeatureConstructor.baseViews
        self.recipeDetailsViewOptions = recipeDetailsFeatureConstructor.recipeDetailsViewOptions
        self.recipeDetailsProductViewOptions = recipeDetailsFeatureConstructor.recipeDetailsProductViewOptions
        self.itemSelectorViewOptions = recipeDetailsFeatureConstructor.itemSelectorViewOptions
        super.init(constructor: baseConstructor)
    }

    public func showRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        let detailVC = RecipeDetailsViewController(
            recipeId,
            isForMealPlanner: isForMealPlanner,
            recipeDetailsViewOptions: recipeDetailsViewOptions,
            recipeDetailsProductViewOptions: recipeDetailsProductViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    public func setRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        let detailVC = RecipeDetailsViewController(
            recipeId,
            isForMealPlanner: isForMealPlanner,
            recipeDetailsViewOptions: recipeDetailsViewOptions,
            recipeDetailsProductViewOptions: recipeDetailsProductViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.viewControllers = [detailVC]
    }
    
    public func showItemSelector(
        ingredientId: String
    ) {
        let itemSelectorVC = ItemSelectorViewController(
            ingredientId: ingredientId,
            itemSelectorViewOptions: itemSelectorViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(itemSelectorVC, animated: true)
    }
    
    public func showSponsorDetails(
        sponsor: Sponsor
    ) {
        let sponsorDetailsVC = SponsorDetailsViewController(
            sponsor: sponsor,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(sponsorDetailsVC, animated: true)
    }
}
