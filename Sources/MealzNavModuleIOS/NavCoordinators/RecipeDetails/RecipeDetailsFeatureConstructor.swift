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
    let baseViews: BasePageViewParameters
    let recipeDetailsViewOptions: RecipeDetailsViewOptions
    let recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions
    let itemSelectorViewOptions: ItemSelectorViewOptions
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeDetailsViewOptions: RecipeDetailsViewOptions = RecipeDetailsViewOptions(),
        recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions = RecipeDetailsProductViewOptions(),
        itemSelectorViewOptions: ItemSelectorViewOptions = ItemSelectorViewOptions()
    ) {
        self.baseViews = baseViews
        self.recipeDetailsViewOptions = recipeDetailsViewOptions
        self.recipeDetailsProductViewOptions = recipeDetailsProductViewOptions
        self.itemSelectorViewOptions = itemSelectorViewOptions
    }
}
