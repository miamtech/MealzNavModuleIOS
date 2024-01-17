//
//  CatalogFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS

@available(iOS 14, *)
public struct CatalogFeatureConstructor {
    let catalogViewOptions: CatalogViewOptions
    let catalogSearchViewOptions: CatalogSearchViewOptions
    let filtersViewOptions: FiltersViewOptions
    let preferencesViewOptions: PreferencesViewOptions
    let preferencesSearchViewOptions: PreferencesSearchViewOptions
    let myMealsViewOptions: MyMealsViewOptions
    
    public init(
        catalogViewOptions: CatalogViewOptions = CatalogViewOptions(),
         catalogSearchViewOptions: CatalogSearchViewOptions = CatalogSearchViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions(),
        preferencesViewOptions: PreferencesViewOptions = PreferencesViewOptions(),
        preferencesSearchViewOptions: PreferencesSearchViewOptions = PreferencesSearchViewOptions(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions()
    ) {
        self.catalogViewOptions = catalogViewOptions
        self.catalogSearchViewOptions = catalogSearchViewOptions
        self.filtersViewOptions = filtersViewOptions
        self.preferencesViewOptions = preferencesViewOptions
        self.preferencesSearchViewOptions = preferencesSearchViewOptions
        self.myMealsViewOptions = myMealsViewOptions
    }
}
