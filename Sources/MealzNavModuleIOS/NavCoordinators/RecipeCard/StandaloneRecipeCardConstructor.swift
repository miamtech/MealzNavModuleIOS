//
//  StandaloneRecipeCardConstructor.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct StandaloneRecipeCardConstructor {
    let recipeCard: TypeSafeCatalogRecipeCard
    let recipeCardLoading: TypeSafeRecipeCardLoading
    let recipeCardDimensions: CGSize
    
    public init(
        recipeCard: TypeSafeCatalogRecipeCard = TypeSafeCatalogRecipeCard(MealzRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading = TypeSafeRecipeCardLoading(MealzRecipeCardLoading()),
        recipeCardDimensions: CGSize = CGSize(width: 360, height: 300)
    ) {
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.recipeCardDimensions = recipeCardDimensions
    }
}
