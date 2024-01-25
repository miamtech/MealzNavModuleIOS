//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 25/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import UIKit

@available(iOS 14, *)
public protocol MealPlannerRecapNavCoordinatorProtocol : BaseNavCoordinatorProtocol {
    var mealPlannerRecapViewOptions: MealPlannerRecapViewOptions { get set }
}
