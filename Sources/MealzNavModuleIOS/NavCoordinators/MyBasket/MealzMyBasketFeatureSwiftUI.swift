//
//  MealzMyBasketFeatureSwiftUI.swift
//
//
//  Created by Antonin Francois on 28/03/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzMyBasketFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: MyBasketFeatureNavCoordinator

    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myBasketContructor: MyBasketFeatureConstructor
    ) {
        let navController = UINavigationController()
        // Hide the navigation bar
        navController.isNavigationBarHidden = hideTitles
        self.coordinator = MyBasketFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            myBasketContructor: myBasketContructor
        )
        self.coordinator.setMyBasket()
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
