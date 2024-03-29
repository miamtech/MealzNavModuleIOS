//
//  MealzMealPlannerFeatureSwiftUI.swift
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
    public let coordinator: MealPlannerFeatureNavCoordinator
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        let navController = UINavigationController()
        // Hide the navigation bar
        navController.isNavigationBarHidden = hideTitles
        self.coordinator = MealPlannerFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            mealPlannerFeatureConstructor: mealPlannerFeatureConstructor
        )
        self.coordinator.setMealPlannerForm()
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
