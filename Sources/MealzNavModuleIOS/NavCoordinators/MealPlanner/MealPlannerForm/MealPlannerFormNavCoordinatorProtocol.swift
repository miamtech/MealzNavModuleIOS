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
public protocol MealPlannerFormNavCoordinatorProtocol : BaseNavCoordinatorProtocol {
    var mealPlannerFormViewOptions: MealPlannerFormViewOptions { get set }
    var baseViews: BasePageViewParameters { get set }
    
    func showMealPlannerResults()
}
