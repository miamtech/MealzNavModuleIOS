//
//  MealPlannerFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import Foundation
import MealzUIModuleIOS

@available(iOS 14, *)
public struct MealPlannerFeatureConstructor {
    let mealPlannerFormViewOptions: MealPlannerFormViewOptions
    let mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    let mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    let mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    let basketRecipeViewOptions: BasketRecipeViewOptions
    let mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    let filtersViewOptions: FiltersViewOptions
    
    public init(
        mealPlannerFormViewOptions: MealPlannerFormViewOptions = MealPlannerFormViewOptions(),
        mealPlannerResultsViewOptions: MealPlannerResultsViewOptions = MealPlannerResultsViewOptions(),
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions = MealPlannerRecipePickerViewOptions(),
        mealPlannerBasketViewOptions: MealPlannerBasketViewOptions = MealPlannerBasketViewOptions(),
        basketRecipeViewOptions: BasketRecipeViewOptions = BasketRecipeViewOptions(),
        mealPlannerRecapViewOptions: MealPlannerRecapViewOptions = MealPlannerRecapViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions()
    ) {
        self.mealPlannerFormViewOptions = mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        self.mealPlannerBasketViewOptions = mealPlannerBasketViewOptions
        self.basketRecipeViewOptions = basketRecipeViewOptions
        self.mealPlannerRecapViewOptions = mealPlannerRecapViewOptions
       
        self.filtersViewOptions = filtersViewOptions
    }
}
