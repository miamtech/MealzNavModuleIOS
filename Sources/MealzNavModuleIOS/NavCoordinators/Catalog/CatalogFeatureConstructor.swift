//
//  CatalogFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct CatalogFeatureConstructor {
    let baseViews: BasePageViewParameters
    let catalogViewOptions: CatalogViewOptions
    let recipesListViewOptions: CatalogRecipesListViewOptions
    let packageRowViewOptions: CatalogPackageRowViewOptions
    let catalogSearchViewOptions: CatalogSearchViewOptions
    let filtersViewOptions: FiltersViewOptions
    let preferencesViewOptions: PreferencesViewOptions
    let preferencesSearchViewOptions: PreferencesSearchViewOptions
    
    let useMealPlanner: Bool
    let usesPreferences: Bool
    
    // grid configs
    let catalogViewGridConfig: CatalogRecipesListGridConfig
    let catalogResultsGridConfig: CatalogRecipesListGridConfig
        
    public init(
        useMealPlanner: Bool = false,
        usesPreferences: Bool = true,
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        catalogViewOptions: CatalogViewOptions =  CatalogViewOptions(),
        recipesListViewOptions: CatalogRecipesListViewOptions = CatalogRecipesListViewOptions(),
        packageRowViewOptions: CatalogPackageRowViewOptions = CatalogPackageRowViewOptions(),
        catalogSearchViewOptions: CatalogSearchViewOptions = CatalogSearchViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions(),
        preferencesViewOptions: PreferencesViewOptions = PreferencesViewOptions(),
        preferencesSearchViewOptions: PreferencesSearchViewOptions = PreferencesSearchViewOptions(),
        catalogViewGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        catalogResultsGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig()
    ) {
        self.baseViews = baseViews
        self.useMealPlanner = useMealPlanner
        self.usesPreferences = usesPreferences
        self.catalogViewOptions = catalogViewOptions
        self.recipesListViewOptions = recipesListViewOptions
        self.packageRowViewOptions = packageRowViewOptions
        self.catalogSearchViewOptions = catalogSearchViewOptions
        self.filtersViewOptions = filtersViewOptions
        self.preferencesViewOptions = preferencesViewOptions
        self.preferencesSearchViewOptions = preferencesSearchViewOptions
        self.catalogViewGridConfig = catalogViewGridConfig
        self.catalogResultsGridConfig = catalogResultsGridConfig
    }
}
