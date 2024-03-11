//
//  RecipeCarouselFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public protocol RecipeCarouselFeatureNavCoordinatorProtocol {
    var baseViews: BasePageViewParameters { get set }
    var recipeCarouselViewOptions: RecipeCarouselViewOptions { get set }
    
    // grid configs
    var recipesCarouselGridConfig: RecipesCarouselGridConfig { get set }
    
    func setRecipeCarousel(productId: String, numberOfResults: Int)
    func setRecipeCarousel(criteria: SuggestionsCriteria, numberOfResults: Int)
}
