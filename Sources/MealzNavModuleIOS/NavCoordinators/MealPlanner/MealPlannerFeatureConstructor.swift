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
//    let mealPlannerCTAViewOptions: MealPlannerCTAViewOptions
    let mealPlannerFormViewOptions: MealPlannerFormViewOptions
    let mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    let mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    let mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    let mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    let filtersViewOptions: FiltersViewOptions
    
    public init(
//        mealPlannerCTAViewOptions: MealPlannerCTAViewOptions = MealPlannerCTAViewOptions(),
        mealPlannerFormViewOptions: MealPlannerFormViewOptions = MealPlannerFormViewOptions(),
        mealPlannerResultsViewOptions: MealPlannerResultsViewOptions = MealPlannerResultsViewOptions(),
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions = MealPlannerRecipePickerViewOptions(),
        mealPlannerBasketViewOptions: MealPlannerBasketViewOptions = MealPlannerBasketViewOptions(),
        mealPlannerRecapViewOptions: MealPlannerRecapViewOptions = MealPlannerRecapViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions()
    ) {
//        self.mealPlannerCTAViewOptions = mealPlannerCTAViewOptions
        self.mealPlannerFormViewOptions = mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        self.mealPlannerBasketViewOptions = mealPlannerBasketViewOptions
        self.mealPlannerRecapViewOptions = mealPlannerRecapViewOptions
       
        self.filtersViewOptions = filtersViewOptions
    }
}
