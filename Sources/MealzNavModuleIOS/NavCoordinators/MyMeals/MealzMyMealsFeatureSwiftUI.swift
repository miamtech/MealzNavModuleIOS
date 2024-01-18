//
//  MealzFavoritesFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzMyMealsFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: MyMealsFeatureNavCoordinator
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myMealsFeatureConstructor: MyMealsFeatureConstructor = MyMealsFeatureConstructor()
    ) {
        let navController = UINavigationController()
        
        self.coordinator = MyMealsFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController,
                baseViews: baseViews
            ),
            recipeDetailsConstructor: RecipeDetailsFeatureConstructor(
                recipeDetailsViewOptions: recipeDetailsConstructor.recipeDetailsViewOptions,
                recipeDetailsProductViewOptions: recipeDetailsConstructor.recipeDetailsProductViewOptions,
                itemSelectorViewOptions: recipeDetailsConstructor.itemSelectorViewOptions
            ),
            myMealsViewOptions: MyMealsFeatureConstructor(
                myMealsViewOptions: myMealsFeatureConstructor.myMealsViewOptions,
                navigateToCatalog: myMealsFeatureConstructor.navigateToCatalog)
        )
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.showMyMeals()
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
