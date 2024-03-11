//
//  MealzRecipeCarouselFeatureUIKit.swift
//
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import UIKit
import miamCore

@available(iOS 14, *)
public class MealzRecipeCarouselFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: RecipeCarouselFeatureNavCoordinator = {
        return RecipeCarouselFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            recipeCarouselFeatureConstructor: recipeCarouselFeatureConstructor
        )
    }()
    
    private let recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public init(
        productId: String,
        numberOfResults: Int,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor = RecipeCarouselFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCarouselFeatureConstructor = recipeCarouselFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setRecipeCarousel(productId: productId, numberOfResults: numberOfResults)
    }
   
    public init(
        criteria: SuggestionsCriteria,
        numberOfResults: Int,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor = RecipeCarouselFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.recipeCarouselFeatureConstructor = recipeCarouselFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setRecipeCarousel(criteria: criteria, numberOfResults: numberOfResults)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the navigation bar
        self.isNavigationBarHidden = true
//        self.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
