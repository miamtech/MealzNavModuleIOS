//
//  CatalogFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import SwiftUI
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public protocol CatalogFeatureNavCoordinatorProtocol {
    var baseViews: BasePageViewParameters { get set }
    var catalogViewOptions: CatalogViewOptions { get set }
    var recipesListViewOptions: CatalogRecipesListViewOptions { get set }
    var packageRowViewOptions: CatalogPackageRowViewOptions { get set }
    var catalogSearchViewOptions: CatalogSearchViewOptions { get set }
    var filtersViewOptions: FiltersViewOptions { get set }
    var preferencesViewOptions: PreferencesViewOptions { get set }
    var preferencesSearchViewOptions: PreferencesSearchViewOptions { get set }
    
    // grid configs
    var catalogViewGridConfig: CatalogRecipesListGridConfig { get set }
    var catalogResultsGridConfig: CatalogRecipesListGridConfig { get set }
    var myMealsRecipesListGridConfig: CatalogRecipesListGridConfig { get set }
        
    func showCatalog(catalogId: String?, categoryTitle: String?)
    func showCatalogResults(catalogId: String?, categoryTitle: String?)
    func showPreferences()
    func showPreferencesSearch()
    func showFilters(filterInstance: FilterInstance)
    func showCatalogSearch(filterInstance: FilterInstance)
}
