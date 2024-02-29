//
//  MealzStandaloneRecipeCardUIKit.swift
//
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit
import miamCore

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
    
    private let recipeDimensions: CGSize
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let recipeCardConstructor: StandaloneRecipeCardConstructor
    
    public init(
        recipeId: String,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCardConstructor = recipeCardConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.showRecipeCard(recipeId: recipeId)
    }
    
    public init(
        recipe: Recipe,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCardConstructor = recipeCardConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.showRecipeCard(recipe: recipe)
    }
    
    public init(
        criteria: SuggestionsCriteria,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCardConstructor = recipeCardConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.showRecipeCard(criteria: criteria)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the navigation bar
        self.isNavigationBarHidden = true
        self.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
