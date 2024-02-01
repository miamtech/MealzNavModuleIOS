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
    
    public init(
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        myMealsRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
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
        coordinator.showCatalog()
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
