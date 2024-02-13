//
//  MealzCatalogFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public struct MealzCatalogFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: CatalogFeatureNavCoordinator
    private let catalogId: String?
    private let categoryTitle: String?
    
    public init(
        catalogId: String? = nil,
        categoryTitle: String? = nil,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        myMealsRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        self.catalogId = catalogId
        self.categoryTitle = categoryTitle
        let navController = UINavigationController()
        let baseConstructor = MealzBaseNavCoordinator.Constructor(
            navigationController: navController
        )
        self.coordinator = CatalogFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsConstructor: recipeDetailsConstructor,
            catalogFeatureConstructor: catalogFeatureConstructor,
            myMealsViewOptions: myMealsViewOptions,
            myMealsRecipesListGridConfig: myMealsRecipesListGridConfig,
            mealPlannerCoordinator: MealPlannerFeatureNavCoordinator(
                baseConstructor: baseConstructor,
                recipeDetailsConstructor: recipeDetailsConstructor,
                mealPlannerFeatureConstructor: mealPlannerFeatureConstructor
            )
        )
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.showCatalog(catalogId: catalogId, categoryTitle: categoryTitle)
        if let catalogId, let categoryTitle { // open results page if they have id & title
            coordinator.showCatalogResults(catalogId: catalogId, categoryTitle: categoryTitle)
        }
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
