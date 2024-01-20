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
    let recipesListViewOptions: CatalogRecipesListViewOptions
    let packageRowViewOptions: CatalogPackageRowViewOptions
    let catalogSearchViewOptions: CatalogSearchViewOptions
    let filtersViewOptions: FiltersViewOptions
    let preferencesViewOptions: PreferencesViewOptions
    let preferencesSearchViewOptions: PreferencesSearchViewOptions
    
    let useMealPlanner: Bool
        
    public init(
        useMealPlanner: Bool = false,
        catalogViewOptions: CatalogViewOptions =  CatalogViewOptions(),
        recipesListViewOptions: CatalogRecipesListViewOptions = CatalogRecipesListViewOptions(),
        packageRowViewOptions: CatalogPackageRowViewOptions = CatalogPackageRowViewOptions(),
        catalogSearchViewOptions: CatalogSearchViewOptions = CatalogSearchViewOptions(),
        filtersViewOptions: FiltersViewOptions = FiltersViewOptions(),
        preferencesViewOptions: PreferencesViewOptions = PreferencesViewOptions(),
        preferencesSearchViewOptions: PreferencesSearchViewOptions = PreferencesSearchViewOptions()
    ) {
        self.useMealPlanner = useMealPlanner
        self.catalogViewOptions = catalogViewOptions
        self.recipesListViewOptions = recipesListViewOptions
        self.packageRowViewOptions = packageRowViewOptions
        self.catalogSearchViewOptions = catalogSearchViewOptions
        self.filtersViewOptions = filtersViewOptions
        self.preferencesViewOptions = preferencesViewOptions
        self.preferencesSearchViewOptions = preferencesSearchViewOptions
    }
}
