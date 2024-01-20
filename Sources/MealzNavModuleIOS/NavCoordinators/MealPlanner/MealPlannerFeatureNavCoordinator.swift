//
//  MealPlannerFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class MealPlannerFeatureNavCoordinator: RecipeDetailsFeatureNavCoordinator {
    
    public var mealPlannerFormViewOptions: MealPlannerFormViewOptions
    public var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    public var mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    public var mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    public var mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    public var filtersViewOptions: FiltersViewOptions
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor
    ) {
        self.mealPlannerFormViewOptions = mealPlannerFeatureConstructor.mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerFeatureConstructor.mealPlannerResultsViewOptions
        self.mealPlannerRecipePickerViewOptions = mealPlannerFeatureConstructor.mealPlannerRecipePickerViewOptions
        self.mealPlannerBasketViewOptions = mealPlannerFeatureConstructor.mealPlannerBasketViewOptions
        self.mealPlannerRecapViewOptions = mealPlannerFeatureConstructor.mealPlannerRecapViewOptions
        
        self.filtersViewOptions = mealPlannerFeatureConstructor.filtersViewOptions
        
        super.init(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor
        )
    }
    
    public func showMealPlannerForm() {
        let formVC = MealPlannerFormViewController(
            mealPlannerFormViewOptions: mealPlannerFormViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(formVC, animated: false)
    }
    
    public func showMealPlannerResults() {
        let resultsVC = MealPlannerResultsViewController(
            mealPlannerResultsViewOptions: mealPlannerResultsViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(resultsVC, animated: false)
    }
    
    public func showMealPlannerRecipePicker(indexOfRecipe: Int) {
        let recipePickerVC = MealPlannerRecipePickerViewController(
            indexOfRecipe: indexOfRecipe,
            mealPlannerRecipePickerViewOptions: mealPlannerRecipePickerViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recipePickerVC, animated: false)
    }
    
    public func showMealPlannerBasket() {
        let basketVC = MealPlannerBasketViewController(
            mealPlannerBasketViewOptions: mealPlannerBasketViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(basketVC, animated: false)
    }
    
    public func showMealPlannerRecap() {
        let recapVC = MealPlannerRecapPurchaseViewController(
            mealPlannerRecapViewOptions: mealPlannerRecapViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recapVC, animated: false)
    }
    
    public func showFilters(filterInstance: FilterInstance) {
        let filtersVC = FiltersViewController(
            filterInstance,
            filtersViewOptions: filtersViewOptions,
            coordinator: self,
            nextNavigationEvent: self.goBack
        )
        navigationController.pushViewController(filtersVC, animated: true)
    }
}
