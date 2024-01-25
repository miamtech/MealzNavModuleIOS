//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 25/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public protocol MealPlannerBasketNavCoordinatorProtocol : BaseNavCoordinatorProtocol {
    var mealPlannerBasketViewOptions: MealPlannerBasketViewOptions { get set }
    var basketRecipeViewOptions: BasketRecipeViewOptions { get set }
}

