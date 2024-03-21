//
//  MealzCatalogFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public struct MealzCatalogFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: CatalogFeatureNavCoordinator
    private let catalogId: String?
    private let categoryTitle: String?
    
    public init(
        hideTitles: Bool = false,
        catalogId: String? = nil,
        categoryTitle: String? = nil,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        myMealsRecipesListGridConfig: CatalogRecipesListGridConfig = myMealsDefaultRecipesListGridConfig,
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        self.catalogId = catalogId
        self.categoryTitle = categoryTitle
        let navController = UINavigationController()
        let baseConstructor = MealzBaseNavCoordinator.Constructor(
            navigationController: navController
        )
        navController.isNavigationBarHidden = hideTitles
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
        self.coordinator.setCatalog()
    }
    
    public func openCatalogResults(catalogId: String?, categoryTitle: String?) {
        self.coordinator.setCatalog() // reset the stack
        self.coordinator.showCatalogResults(catalogId: catalogId, categoryTitle: categoryTitle)
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
