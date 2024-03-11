//
//  RecipeCarouselFeatureConstructor.swift
//  
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct RecipeCarouselFeatureConstructor {
    let baseViews: BasePageViewParameters
    let recipeCarouselViewOptions: RecipeCarouselViewOptions
    
    // grid configs
    let recipesCarouselGridConfig: RecipesCarouselGridConfig
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeCarouselViewOptions: RecipeCarouselViewOptions = RecipeCarouselViewOptions(),
        recipesCarouselGridConfig: RecipesCarouselGridConfig = RecipesCarouselGridConfig()
    ) {
        self.baseViews = baseViews
        self.recipeCarouselViewOptions = recipeCarouselViewOptions
        self.recipesCarouselGridConfig = recipesCarouselGridConfig
    }
}
