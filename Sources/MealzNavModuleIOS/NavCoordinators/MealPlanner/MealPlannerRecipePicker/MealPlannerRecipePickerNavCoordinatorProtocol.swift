//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public protocol MealPlannerRecipePickerNavCoordinatorProtocol : BaseNavCoordinatorProtocol {
    var mealPlannerRecipePickerViewOptions: MealPlannerRecipePickerViewOptions { get set }

    
}
