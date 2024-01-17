//
//  MealzBaseNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import UIKit
import miamCore

@available(iOS 14, *)
public class MealzBaseNavCoordinator: BaseNavCoordinator {
    public var navigationController: UINavigationController
    
    public var baseViews: BaseViewParameters
    
    public var recipeDetailsViewOptions: RecipeDetailsViewOptions
    public var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
    public var itemSelectorViewOptions: ItemSelectorViewOptions
    
    struct Constructor {
        let navigationController: UINavigationController
        let baseViews: BaseViewParameters
        let recipeDetailsViewOptions: RecipeDetailsViewOptions
        let recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
        let itemSelectorViewOptions: ItemSelectorViewOptions
    }

    init(
        constructor: Constructor
    ) {
        self.navigationController = constructor.navigationController
        self.baseViews = constructor.baseViews
    
        self.recipeDetailsViewOptions = constructor.recipeDetailsViewOptions
        self.recipeDetailsProductViewOptions = constructor.recipeDetailsProductViewOptions
        self.itemSelectorViewOptions = constructor.itemSelectorViewOptions
    }
    
    public func goBack() {
        navigationController.popViewController(animated: true)
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
