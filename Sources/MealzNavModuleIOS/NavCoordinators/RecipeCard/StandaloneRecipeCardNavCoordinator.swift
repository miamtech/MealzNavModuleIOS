//
//  StandaloneRecipeCardNavCoordinator.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework
import UIKit

@available(iOS 14, *)
public class StandaloneRecipeCardNavCoordinator: MealzBaseNavCoordinator, StandaloneRecipeCardNavCoordinatorProtocol {
    public var recipeCard: TypeSafeCatalogRecipeCard
    public var recipeCardLoading: TypeSafeRecipeCardLoading
    public var recipeCardDimensions: CGSize
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit? = nil
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public var viewController: UIViewController?
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        recipeCardConstructor: StandaloneRecipeCardConstructor = StandaloneRecipeCardConstructor()
    ) {
        self.recipeCard = recipeCardConstructor.recipeCard
        self.recipeCardLoading = recipeCardConstructor.recipeCardLoading
        self.recipeCardDimensions = recipeCardConstructor.recipeCardDimensions
        self.recipeDetailsConstructor = recipeDetailsConstructor
        super.init(constructor: baseConstructor)
    }
    
    public func showRecipeCard(
        recipeId: String
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            recipeId: recipeId,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    public func showRecipeCard(
        recipe: Recipe
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            recipe: recipe,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    public func showRecipeCard(
        criteria: SuggestionsCriteria
    ) {
        let recipeCardVC = StandaloneRecipeCardViewController(
            criteria: criteria,
            recipeCard: recipeCard,
            recipeCardLoading: recipeCardLoading,
            recipeCardDimensions: recipeCardDimensions,
            coordinator: self
        )
        navigationController.pushViewController(recipeCardVC, animated: false)
    }
    
    // for using a modal (used on Recipe Card)
    public func presentRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeId: recipeId, recipeDetailsConstructor: self.recipeDetailsConstructor)
        if let recipeDetailsView {
            viewController?.present(recipeDetailsView, animated: true)
            let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
            recipeDetailsView.navigationBar.topItem?.rightBarButtonItem = closeButton
        }
    }
    
    @objc func closeTapped() {
        // Dismiss the navigation controller
        viewController?.dismiss(animated: true, completion: nil)
    }
}
