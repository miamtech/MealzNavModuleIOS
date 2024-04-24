//
//  MealPlannerFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import Foundation
import MealzUIModuleIOS
import MealzIOSFramework

@available(iOS 14, *)
public struct MealPlannerFeatureConstructor {
    let baseViews: BasePageViewParameters
    let mealPlannerFormViewOptions: MealPlannerFormViewOptions
    let mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    let mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions
    let mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    let basketRecipeViewOptions: BasketRecipeViewOptions
    let mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    let filtersViewOptions: FiltersViewOptions
    
    // grid configs
    public var basketRecipeGridConfig: BasketRecipesGridConfig
    public var mealPlannerRecipesListGridConfig: MealPlannerRecipesListGridConfig
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        mealPlannerFormViewOptions: MealPlannerFormViewOptions = MealPlannerFormViewOptions(),
        mealPlannerResultsViewOptions: MealPlannerResultsViewOptions = MealPlannerResultsViewOptions(),
        mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions = MealPlannerRecipePickerViewOptions(),
        mealPlannerBasketViewOptions: MealPlannerBasketViewOptions = MealPlannerBasketViewOptions(),
        basketRecipeViewOptions: BasketRecipeViewOptions = BasketRecipeViewOptions(),
        mealPlannerRecapViewOptions: MealPlannerRecapViewOptions = MealPlannerRecapViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions(),
        basketRecipeGridConfig: BasketRecipesGridConfig = BasketRecipesGridConfig(),
        mealPlannerRecipesListGridConfig: MealPlannerRecipesListGridConfig = MealPlannerRecipesListGridConfig(),
        catalogRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig()
    ) {
        self.baseViews = baseViews
        self.mealPlannerFormViewOptions = mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.mealPlannerRecipePickerViewOptions = mealPlannerRecipePickerViewOptions
        self.mealPlannerBasketViewOptions = mealPlannerBasketViewOptions
        self.basketRecipeViewOptions = basketRecipeViewOptions
        self.mealPlannerRecapViewOptions = mealPlannerRecapViewOptions
       
        self.filtersViewOptions = filtersViewOptions
        
        self.basketRecipeGridConfig = basketRecipeGridConfig
        self.mealPlannerRecipesListGridConfig = mealPlannerRecipesListGridConfig
        self.catalogRecipesListGridConfig = catalogRecipesListGridConfig
    }
}
