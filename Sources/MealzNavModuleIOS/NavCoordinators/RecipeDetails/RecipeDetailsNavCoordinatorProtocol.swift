//
//  RecipeDetailsNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

//todo new nav remove 
@available(iOS 14, *)
public protocol RecipeDetailsNavCoordinatorProtocol {
    var recipeDetailsViewOptions: RecipeDetailsViewOptions { get set }
    var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions { get set }
    var itemSelectorViewOptions: ItemSelectorViewOptions { get set }
    
    func showRecipeDetails(recipeId: String, isForMealPlanner: Bool)
    func showItemSelector(ingredientId: String)
    func showSponsorDetails(sponsor: Sponsor)
}



@available(iOS 14, *)
public protocol RecipeDetailsNavCoordinatorProtocol_Bis: BaseNavCoordinatorProtocol {
    var recipeDetailsViewOptions: RecipeDetailsViewOptions { get set }
    var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions { get set }
    var baseViews: BasePageViewParameters { get set }
    
    func showRecipeDetails(recipeId: String, isForMealPlanner: Bool)
    func showItemSelector(ingredientId: String)
    func showSponsorDetails(sponsor: Sponsor)
    
}
