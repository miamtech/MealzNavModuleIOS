//
//  MealPlannerFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public protocol MealPlannerFeatureNavCoordinatorProtocol {
    var baseViews: BasePageViewParameters { get set }
    var mealPlannerFormViewOptions: MealPlannerFormViewOptions { get set }
    var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions { get set }
    var mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions { get set }
    var mealPlannerBasketViewOptions: MealPlannerBasketViewOptions { get set }
    var basketRecipeViewOptions: BasketRecipeViewOptions { get set }
    var mealPlannerRecapViewOptions: MealPlannerRecapViewOptions { get set }
    
    var filtersViewOptions: FiltersViewOptions { get set }
    
    // grid configs
    var basketRecipeGridConfig: BasketRecipesGridConfig { get set }
    var mealPlannerRecipesListGridConfig: MealPlannerRecipesListGridConfig { get set }
    var catalogRecipesListGridConfig: CatalogRecipesListGridConfig { get set }
    
    func setMealPlannerForm()
    
    func showMealPlannerForm()
    func showMealPlannerResults()
    func showMealPlannerRecipePicker(indexOfRecipe: Int)
    func showMealPlannerBasket()
    func showMealPlannerRecap()
    
    func showFilters(filterInstance: FilterInstance)
}
