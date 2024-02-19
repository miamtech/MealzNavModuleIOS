//
//  MealzMealPlannerFeatureUIKit.swift
//  
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit

@available(iOS 14, *)
public class MealzMealPlannerFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: MealPlannerFeatureNavCoordinator = {
        return MealPlannerFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            mealPlannerFeatureConstructor: mealPlannerFeatureConstructor
        )
    }()
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let mealPlannerFeatureConstructor: MealPlannerFeatureConstructor
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.mealPlannerFeatureConstructor = mealPlannerFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setMealPlannerForm()
        // Hide the navigation bar
        self.isNavigationBarHidden = hideTitles
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
