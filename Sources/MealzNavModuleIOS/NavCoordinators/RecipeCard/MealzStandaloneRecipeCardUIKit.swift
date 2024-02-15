//
//  MealzStandaloneRecipeCardUIKit.swift
//
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit

@available(iOS 14, *)
public class MealzStandaloneRecipeCardUIKit: UINavigationController {
    
    private lazy var coordinator: StandaloneRecipeCardNavCoordinator = {
        return StandaloneRecipeCardNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            recipeCardConstructor: recipeCardConstructor
        )
    }()
    
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let recipeCardConstructor: StandaloneRecipeCardConstructor
    
    public init(
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCardConstructor = recipeCardConstructor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
