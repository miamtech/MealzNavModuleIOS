//
//  MealzFavoritesFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzMyMealsFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: MyMealsFeatureNavCoordinator
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myMealsContructor: MyMealsFeatureConstructor
    ) {
        let navController = UINavigationController()
        // Hide the navigation bar
        navController.isNavigationBarHidden = hideTitles
        self.coordinator = MyMealsFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            myMealsContructor: myMealsContructor
        )
        self.coordinator.setMyMeals()
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
