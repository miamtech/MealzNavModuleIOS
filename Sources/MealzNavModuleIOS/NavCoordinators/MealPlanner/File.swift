//
//  File.swift
//
//
//  Created by Diarmuid McGonagle on 20/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzMealPlannerFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: MealPlannerFeatureNavCoordinator
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        let navController = UINavigationController()
        
        self.coordinator = MealPlannerFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController,
                baseViews: baseViews
            ),
            recipeDetailsConstructor: RecipeDetailsFeatureConstructor(
                recipeDetailsViewOptions: recipeDetailsConstructor.recipeDetailsViewOptions,
                recipeDetailsProductViewOptions: recipeDetailsConstructor.recipeDetailsProductViewOptions,
                itemSelectorViewOptions: recipeDetailsConstructor.itemSelectorViewOptions
            ),
            mealPlannerFeatureConstructor: MealPlannerFeatureConstructor(
                mealPlannerFormViewOptions: mealPlannerFeatureConstructor.mealPlannerFormViewOptions,
                mealPlannerResultsViewOptions: mealPlannerFeatureConstructor.mealPlannerResultsViewOptions,
                mealPlannerRecipePickerViewOptions: mealPlannerFeatureConstructor.mealPlannerRecipePickerViewOptions,
                mealPlannerBasketViewOptions: mealPlannerFeatureConstructor.mealPlannerBasketViewOptions,
                mealPlannerRecapViewOptions: mealPlannerFeatureConstructor.mealPlannerRecapViewOptions,
                filtersViewOptions: mealPlannerFeatureConstructor.filtersViewOptions
            )
        )
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.showMealPlannerForm()
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
