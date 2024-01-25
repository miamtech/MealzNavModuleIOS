//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 25/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import UIKit

@available(iOS 14, *)
public class CatalogResultsCoordinator : MealzBaseNavCoordinator {
    
    
    public init(
        navigationController: UINavigationController,
        baseViews: BasePageViewParameters
    ) {
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    
    public override func start() {
        
    }
 
    
    public func showRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        
        let recipeDetailsNavCoordinator = RecipeDetailsNavCoordinator(
            recipeDetailsViewOptions: mealPlannerFeatureNavCoordinator.recipeDetailsViewOptions,
            recipeDetailsProductViewOptions: mealPlannerFeatureNavCoordinator.recipeDetailsProductViewOptions,
            baseViews: baseViews,
            navigationController: navigationController)
            
            
            self.children.append(recipeDetailsNavCoordinator)
        recipeDetailsNavCoordinator.parent = self
        recipeDetailsNavCoordinator.showRecipeDetails(recipeId: recipeId, isForMealPlanner: isForMealPlanner)
        
    }
    
    public func showFilters(filterInstance: FilterInstance) {
       let coordinator = FilterNavCoordinator(navigationController: navigationController, baseViews: baseViews)
        self.children.append(coordinator)
        coordinator.parent = self
        coordinator.showFilters(filterInstance: filterInstance)
    }
    
    public func showCatalogSearch(filterInstance: FilterInstance) {
        
        
    }
    
    public func showCatalogResults(
        catalogId: String? = nil,
        categoryTitle: String? = nil
    ) {
    }
    
    public func showPreferences() {
        
    }
    
    public func showMyMeals() {
        
    }
}
