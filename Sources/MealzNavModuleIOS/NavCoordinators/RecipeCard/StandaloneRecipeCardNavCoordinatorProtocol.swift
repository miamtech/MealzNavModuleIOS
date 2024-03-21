//
//  StandaloneRecipeCardNavCoordinatorProtocol.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MealzIOSFramework
import mealzcore

@available(iOS 14, *)
public protocol StandaloneRecipeCardNavCoordinatorProtocol {
    var recipeCard: TypeSafeCatalogRecipeCard { get set }
    var recipeCardLoading: TypeSafeRecipeCardLoading { get set }
    var recipeCardDimensions: CGSize { get set }
    
    func showRecipeCard(recipeId: String)
    func showRecipeCard(recipe: Recipe)
    func showRecipeCard(criteria: SuggestionsCriteria)
}
