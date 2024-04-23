//
//  MealPlannerFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework
import UIKit

@available(iOS 14, *)
public class MealPlannerFeatureNavCoordinator: MealzBaseNavCoordinator {
    public var baseViews: BasePageViewParameters
    public var mealPlannerFormViewOptions: MealPlannerFormViewOptions
    public var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    public var mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    public var mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    public var basketRecipeViewOptions: BasketRecipeViewOptions
    public var mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    public var filtersViewOptions: FiltersViewOptions
    
    // grid configs
    public var basketRecipeGridConfig: BasketRecipesGridConfig
    public var mealPlannerRecipesListGridConfig: MealPlannerRecipesListGridConfig
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        self.baseViews = mealPlannerFeatureConstructor.baseViews
        self.mealPlannerFormViewOptions = mealPlannerFeatureConstructor.mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerFeatureConstructor.mealPlannerResultsViewOptions
        self.mealPlannerRecipePickerViewOptions = mealPlannerFeatureConstructor.mealPlannerRecipePickerViewOptions
        self.mealPlannerBasketViewOptions = mealPlannerFeatureConstructor.mealPlannerBasketViewOptions
        self.basketRecipeViewOptions = mealPlannerFeatureConstructor.basketRecipeViewOptions
        self.mealPlannerRecapViewOptions = mealPlannerFeatureConstructor.mealPlannerRecapViewOptions
        
        self.filtersViewOptions = mealPlannerFeatureConstructor.filtersViewOptions
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        
        self.basketRecipeGridConfig = mealPlannerFeatureConstructor.basketRecipeGridConfig
        self.mealPlannerRecipesListGridConfig = mealPlannerFeatureConstructor.mealPlannerRecipesListGridConfig
        self.catalogRecipesListGridConfig = mealPlannerFeatureConstructor.catalogRecipesListGridConfig
        
        super.init(constructor: baseConstructor)
    }
    
    // only used when navigation controller is from a Mealz UIKit or SwiftUI standalone
    internal func setMealPlannerForm() {
        let formVC = MealPlannerFormViewController(
            mealPlannerFormViewOptions: mealPlannerFormViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.viewControllers = [formVC]
        navigationController.navigationBar.tintColor = UIColor.white
    }
    
    public func showMealPlannerForm() {
        let formVC = MealPlannerFormViewController(
            mealPlannerFormViewOptions: mealPlannerFormViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(formVC, animated: true)
    }
    
    public func showMealPlannerResults() {
        let resultsVC = MealPlannerResultsViewController(
            mealPlannerResultsViewOptions: mealPlannerResultsViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator)
        navigationController.pushViewController(resultsVC, animated: true)
    }
    
    public func showMealPlannerRecipePicker(indexOfRecipe: Int) {
        let recipePickerVC = MealPlannerRecipePickerViewController(
            indexOfRecipe: indexOfRecipe,
            mealPlannerRecipePickerViewOptions: mealPlannerRecipePickerViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator)
        navigationController.pushViewController(recipePickerVC, animated: true)
    }
    
    public func showMealPlannerBasket() {
        let basketVC = MealPlannerBasketViewController(
            mealPlannerBasketViewOptions: mealPlannerBasketViewOptions,
            basketRecipeViewOptions: basketRecipeViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator)
        navigationController.pushViewController(basketVC, animated: true)
    }
    
    public func showMealPlannerRecap() {
        let recapVC = MealPlannerRecapPurchaseViewController(
            mealPlannerRecapViewOptions: mealPlannerRecapViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recapVC, animated: true)
    }
    
    public func showFilters(filterInstance: FilterInstance) {
        let filtersVC = MealzFiltersViewController(
            filterInstance,
            filtersViewOptions: filtersViewOptions,
            coordinator: self,
            nextNavigationEvent: self.goBack
        )
        navigationController.pushViewController(filtersVC, animated: true)
    }
    
    public func popEntireFeature() {
        navigationController.popToRootViewController(animated: true)
    }
}
