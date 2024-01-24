//
//  File.swift
//
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class MealPlannerRecipePickerNavCoordinator : MealzBaseNavCoordinator, MealPlannerRecipePickerNavCoordinatorProtocol {
    public var mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    
    init(
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions,
         navigationController: UINavigationController,
        baseViews: BasePageViewParameters
    ) {
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    
    public override func start() {
        
    }
    
    public func showMealPlannerRecipePicker(indexOfRecipe: Int) {
        let recipePickerVC = MealPlannerRecipePickerViewController(
            indexOfRecipe: indexOfRecipe,
            mealPlannerRecipePickerViewOptions: mealPlannerRecipePickerViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recipePickerVC, animated: false)
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
        /*let filtersVC = FiltersViewController(
            filterInstance,
            filtersViewOptions: filtersViewOptions,
            coordinator: self,
            nextNavigationEvent: self.goBack
        )
        navigationController.pushViewController(filtersVC, animated: true)*/
    }
    
    public override func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    
    
}
