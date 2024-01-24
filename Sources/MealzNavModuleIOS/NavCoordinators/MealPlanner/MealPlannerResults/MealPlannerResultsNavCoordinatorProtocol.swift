//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 23/01/2024.
//

import Foundation

import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public protocol MealPlannerResultsNavCoordinatorProtocol: BaseNavCoordinatorProtocol {
    var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions { get set }
    var baseViews: BasePageViewParameters { get set }
    
    
}
