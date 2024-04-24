//
//  MealzRecipeDetailsFeatureUIKit.swift
//
//
//  Created by miam x didi on 15/02/2024.
//

import Foundation
import UIKit

@available(iOS 14, *)
public class MealzRecipeDetailsFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: RecipeDetailsFeatureNavCoordinator = {
        return RecipeDetailsFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsFeatureConstructor: recipeDetailsConstructor
        )
    }()
    
    private var recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public init(
        recipeId: String,
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        super.init(nibName: nil, bundle: nil)
        // Hide the navigation bar
        self.isNavigationBarHidden = hideTitles
        self.coordinator.setRecipeDetails(recipeId: recipeId)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//    func showRecipeDetails(recipeId: String) {
//        self.coordinator.setRecipeDetails(recipeId: recipeId)
//    }
}
