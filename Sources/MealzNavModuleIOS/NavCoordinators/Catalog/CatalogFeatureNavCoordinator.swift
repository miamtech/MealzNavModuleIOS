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
    public var baseViews: BasePageViewParameters
    public var catalogViewOptions: CatalogViewOptions
    public var recipesListViewOptions: CatalogRecipesListViewOptions
    public var packageRowViewOptions: CatalogPackageRowViewOptions
    public var catalogSearchViewOptions: CatalogSearchViewOptions
    public var filtersViewOptions: FiltersViewOptions
    public var preferencesViewOptions: PreferencesViewOptions
    public var preferencesSearchViewOptions: PreferencesSearchViewOptions
    public var myMealsViewOptions: MyMealsViewOptions
    public var navigateToCatalog: () -> Void
    
    public var mealPlannerCoordinator: MealPlannerFeatureNavCoordinator?
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    private let usesPreferences: Bool
    
    init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        catalogFeatureConstructor: CatalogFeatureConstructor,
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        mealPlannerCoordinator: MealPlannerFeatureNavCoordinator
    ) {
        self.baseViews = catalogFeatureConstructor.baseViews
        self.catalogViewOptions = catalogFeatureConstructor.catalogViewOptions
        self.catalogSearchViewOptions = catalogFeatureConstructor.catalogSearchViewOptions
        self.recipesListViewOptions = catalogFeatureConstructor.recipesListViewOptions
        self.packageRowViewOptions = catalogFeatureConstructor.packageRowViewOptions
        self.filtersViewOptions = catalogFeatureConstructor.filtersViewOptions
        self.preferencesViewOptions = catalogFeatureConstructor.preferencesViewOptions
        self.preferencesSearchViewOptions = catalogFeatureConstructor.preferencesSearchViewOptions
        self.myMealsViewOptions = myMealsViewOptions

        if catalogFeatureConstructor.useMealPlanner {
            self.mealPlannerCoordinator = mealPlannerCoordinator
        } else { self.mealPlannerCoordinator = nil }
        
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        
        self.usesPreferences = catalogFeatureConstructor.usesPreferences
        self.navigateToCatalog = {}
        super.init(constructor: baseConstructor)
    }
    
    public func showCatalog() {
        let catalogVC = CatalogViewController(
            catalogViewOptions: catalogViewOptions, 
            packageRowViewOptions: packageRowViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            usesPreferences: usesPreferences,
            navigateToMealPlanner: self.mealPlannerCoordinator?.showMealPlannerForm
        )
        navigationController.pushViewController(catalogVC, animated: false)
    }
    
    public func showCatalogResultsFromSideView(
        catalogId: String? = nil,
        categoryTitle: String? = nil
    ) {
        let resultsVC = CatalogResultsViewController(
            categoryId: catalogId,
            categoryTitle: categoryTitle,
            catalogViewOptions: catalogViewOptions, 
            recipesListViewOptions: recipesListViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator
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
    
    public func showCatalogResults(
        catalogId: String? = nil,
        categoryTitle: String? = nil
    ) {
        let resultsVC = CatalogResultsViewController(
            categoryId: catalogId,
            categoryTitle: categoryTitle,
            catalogViewOptions: catalogViewOptions, 
            recipesListViewOptions: recipesListViewOptions,
            baseViews: baseViews,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator
        )
        navigationController.pushViewController(resultsVC, animated: true)
    }
    
    
    public func showPreferences() {
        let preferencesVC = PreferencesViewController(
            preferencesViewOptions: preferencesViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(preferencesVC, animated: true)
    }
    
    public func showPreferencesSearch() {
        let preferencesSearchVC = PreferencesSearchViewController(
            preferencesSearchViewOptions: preferencesSearchViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(preferencesSearchVC, animated: true)
    }
    
    public func showFilters(filterInstance: FilterInstance) {
        let filtersVC = FiltersViewController(
            filterInstance,
            filtersViewOptions: filtersViewOptions,
            coordinator: self,
            nextNavigationEvent: { self.showCatalogResultsFromSideView() }
        )
        navigationController.pushViewController(filtersVC, animated: true)
    }
    
    public func showCatalogSearch(filterInstance: FilterInstance) {
        let catalogSearchVC = CatalogSearchViewController(
            filterInstance,
            catalogSearchViewOptions: catalogSearchViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(catalogSearchVC, animated: true)
    }
    
    public func showMyMeals() {
        let myMealsVC = MyMealsViewController(
            myMealsViewOptions: myMealsViewOptions,
            baseViews: baseViews,
            coordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: self.goBack
        )
        navigationController.pushViewController(myMealsVC, animated: true)
    }
}
