//
//  CatalogFeatureNavCoordinator.swift
//  
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class CatalogFeatureNavCoordinator: MealzBaseNavCoordinator, CatalogFeatureNavCoordinatorProtocol {
    public var catalogViewOptions: CatalogViewOptions
    public var catalogSearchViewOptions: CatalogSearchViewOptions
    public var filtersViewOptions: FiltersViewOptions
    public var preferencesViewOptions: PreferencesViewOptions
    public var preferencesSearchViewOptions: PreferencesSearchViewOptions
    public var myMealsViewOptions: MyMealsViewOptions
    
    init(
        baseConstructor: Constructor,
        catalogFeatureConstructor: CatalogFeatureConstructor
    ) {
        self.catalogViewOptions = catalogFeatureConstructor.catalogViewOptions
        self.catalogSearchViewOptions = catalogFeatureConstructor.catalogSearchViewOptions
        self.filtersViewOptions = catalogFeatureConstructor.filtersViewOptions
        self.preferencesViewOptions = catalogFeatureConstructor.preferencesViewOptions
        self.preferencesSearchViewOptions = catalogFeatureConstructor.preferencesSearchViewOptions
        self.myMealsViewOptions = catalogFeatureConstructor.myMealsViewOptions
        super.init(constructor: baseConstructor)
    }
    
    public func showCatalog() {
        let catalogVC = CatalogViewController(
            catalogViewOptions: catalogViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(catalogVC, animated: false)
    }
    
    public func showCatalogResults(
        catalogId: String? = nil,
        categoryTitle: String? = nil
    ) {
        let resultsVC = CatalogResultsViewController(
            categoryId: catalogId,
            categoryTitle: categoryTitle,
            catalogViewOptions: catalogViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        // complex to remove this view from stack after redirecting to Results page so Results can directly navigate back to CatalogView
        if let viewA = self.navigationController.viewControllers.first {
            let viewB = resultsVC
            self.navigationController.setViewControllers([viewA, viewB], animated: true)
        } else {
            // Handle the case where viewA is nil, if necessary
            self.navigationController.setViewControllers([resultsVC], animated: true)
        }
    }
    
    
    func showPreferences() {
        let preferencesVC = PreferencesViewController(
            preferencesViewOptions: preferencesViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(preferencesVC, animated: true)
    }
    
    func showPreferencesSearch() {
        let preferencesSearchVC = PreferencesSearchViewController(
            preferencesSearchViewOptions: preferencesSearchViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(preferencesSearchVC, animated: true)
    }
    
    func showFilters(filterInstance: FilterInstance) {
        let filtersVC = FiltersViewController(
            filterInstance,
            filtersViewOptions: filtersViewOptions,
            coordinator: self
        )
        navigationController.pushViewController(filtersVC, animated: true)
    }
    
    func showCatalogSearch(filterInstance: FilterInstance) {
        let catalogSearchVC = CatalogSearchViewController(
            filterInstance,
            catalogSearchViewOptions: catalogSearchViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(catalogSearchVC, animated: true)
    }
    
    func showMyMeals() {
        let myMealsVC = MyMealsViewController(
            myMealsViewOptions: myMealsViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(myMealsVC, animated: true)
    }
}
