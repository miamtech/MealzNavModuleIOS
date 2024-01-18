//
//  CatalogFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public protocol CatalogFeatureNavCoordinatorProtocol {
    var catalogViewOptions: CatalogViewOptions { get set }
    var catalogSearchViewOptions: CatalogSearchViewOptions { get set }
    var filtersViewOptions: FiltersViewOptions { get set }
    var preferencesViewOptions: PreferencesViewOptions { get set }
    var preferencesSearchViewOptions: PreferencesSearchViewOptions { get set }
    
    var navigateToMealPlanner: (() -> Void)? { get set }
    
    func showCatalog()
    func showCatalogResults(catalogId: String?, categoryTitle: String?)
    func showPreferences()
    func showPreferencesSearch()
    func showFilters(filterInstance: FilterInstance)
    func showCatalogSearch(filterInstance: FilterInstance)
}
