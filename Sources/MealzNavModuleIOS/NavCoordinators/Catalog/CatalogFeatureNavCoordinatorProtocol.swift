//
//  CatalogFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import SwiftUI
import MealzUIModuleIOS

@available(iOS 14, *)
public protocol CatalogFeatureNavCoordinatorProtocol {
    var catalogViewOptions: CatalogViewOptions { get set }
    var catalogSearchViewOptions: CatalogSearchViewOptions { get set }
    var filtersViewOptions: FiltersViewOptions { get set }
    var preferencesViewOptions: PreferencesViewOptions { get set }
    var preferencesSearchViewOptions: PreferencesSearchViewOptions { get set }
    var myMealsViewOptions: MyMealsViewOptions { get set }
    
    func showCatalog()
}
