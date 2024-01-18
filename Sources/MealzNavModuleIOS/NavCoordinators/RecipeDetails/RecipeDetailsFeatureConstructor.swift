//
//  RecipeDetailsFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS

@available(iOS 14, *)
public struct RecipeDetailsFeatureConstructor {
    let recipeDetailsViewOptions: RecipeDetailsViewOptions
    let recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
    let itemSelectorViewOptions: ItemSelectorViewOptions
    
    public init(
        recipeDetailsViewOptions: RecipeDetailsViewOptions = RecipeDetailsViewOptions(),
        recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions = RecipeDetailsProductViewOptions(),
        itemSelectorViewOptions: ItemSelectorViewOptions = ItemSelectorViewOptions()
    ) {
        self.recipeDetailsViewOptions = recipeDetailsViewOptions
        self.recipeDetailsProductViewOptions = recipeDetailsProductViewOptions
        self.itemSelectorViewOptions = itemSelectorViewOptions
    }
}
