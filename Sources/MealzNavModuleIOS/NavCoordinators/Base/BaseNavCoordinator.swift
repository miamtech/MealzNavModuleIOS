//
//  BaseNavCoordinator.swift
//  
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import UIKit

@available(iOS 14, *)
public protocol BaseNavCoordinator {
    var navigationController: UINavigationController { get set }
    
    var baseViews: BaseViewParameters { get set }
    // Recipe Details
    var recipeDetailsViewOptions: RecipeDetailsViewOptions { get set }
    var recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions { get set }
    // Item Selector
    var itemSelectorViewOptions: ItemSelectorViewOptions { get set }
}
