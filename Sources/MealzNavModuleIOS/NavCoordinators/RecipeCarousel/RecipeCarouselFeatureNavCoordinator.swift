//
//  RecipeCarouselFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework
import UIKit

@available(iOS 14, *)
public class RecipeCarouselFeatureNavCoordinator: MealzBaseNavCoordinator, RecipeCarouselFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var recipeCarouselViewOptions: RecipeCarouselViewOptions
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit? = nil
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public var viewController: UIViewController?
    
    // grid configs
    public var recipesCarouselGridConfig: RecipesCarouselGridConfig
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCarouselFeatureConstructor: RecipeCarouselFeatureConstructor
    ) {
        self.baseViews = recipeCarouselFeatureConstructor.baseViews
        self.recipeCarouselViewOptions = recipeCarouselFeatureConstructor.recipeCarouselViewOptions
        let recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        self.recipesCarouselGridConfig = recipeCarouselFeatureConstructor.recipesCarouselGridConfig
        self.recipeDetailsConstructor = recipeDetailsConstructor
        super.init(constructor: baseConstructor)
    }
    
    public func setRecipeCarousel(productId: String, numberOfResults: Int) {
        let recipeCarouselVC = RecipeCarouselViewController(
            productId: productId,
            numberOfResults: numberOfResults,
            recipeCarouselViewOptions: recipeCarouselViewOptions,
            baseViews: baseViews,
            gridConfig: recipesCarouselGridConfig,
            coordinator: self
        )
        navigationController.viewControllers = [recipeCarouselVC]
    }

    public func setRecipeCarousel(criteria: SuggestionsCriteria, numberOfResults: Int) {
    let recipeCarouselVC = RecipeCarouselViewController(
        criteria: criteria,
        numberOfResults: numberOfResults,
        recipeCarouselViewOptions: recipeCarouselViewOptions,
        baseViews: baseViews,
        gridConfig: recipesCarouselGridConfig,
        coordinator: self
    )
    navigationController.viewControllers = [recipeCarouselVC]
}
    
    // for using a modal (used on Recipe Card)
    public func presentRecipeDetails(
        recipeId: String
    ) {
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeId: recipeId, recipeDetailsConstructor: self.recipeDetailsConstructor)
        if let recipeDetailsView {
            navigationController.present(recipeDetailsView, animated: true)
            let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
            recipeDetailsView.navigationBar.topItem?.rightBarButtonItem = closeButton
        }
    }
    
    @objc func closeTapped() {
        // Dismiss the navigation controller
        navigationController.dismiss(animated: true, completion: nil)
    }
}
