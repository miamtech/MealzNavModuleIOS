//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation
import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore




@available(iOS 14, *)
public class RecipeDetailsNavCoordinator : MealzBaseNavCoordinator, RecipeDetailsNavCoordinatorProtocol_Bis {
   
    public var recipeDetailsViewOptions: RecipeDetailsViewOptions
    
    public var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
    
     init(
        recipeDetailsViewOptions: RecipeDetailsViewOptions,
        recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions,
        baseViews: BasePageViewParameters,
        navigationController: UINavigationController
    ) {
        self.recipeDetailsViewOptions = recipeDetailsViewOptions
        self.recipeDetailsProductViewOptions = recipeDetailsProductViewOptions
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    
    public override func start() {
       
    }
    
    public override func goBack() {
        self.navigationController.popViewController(animated: true)
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
    
    public func showItemSelector(ingredientId: String) {
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        let itemSelectorNavCoordinator = ItemSelectorNavCoordinator(
            itemSelectorViewOptions: mealPlannerFeatureNavCoordinator.itemSelectorViewOptions,
            baseViews: baseViews,
            navigationController: navigationController)
            
        self.children.append(itemSelectorNavCoordinator)
        itemSelectorNavCoordinator.parent = self
        itemSelectorNavCoordinator.showItemSelector(ingredientId: ingredientId)
        
        
    }
    
    public func showSponsorDetails(sponsor: Sponsor) {
        
    }
    
    
    
}
