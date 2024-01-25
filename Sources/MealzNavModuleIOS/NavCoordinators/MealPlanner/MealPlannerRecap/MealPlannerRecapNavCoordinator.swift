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
public class MealPlannerRecapNavCoordinator: MealzBaseNavCoordinator, MealPlannerRecapNavCoordinatorProtocol {
    public var mealPlannerRecapViewOptions: MealPlannerRecapViewOptions
    
    init(
        mealPlannerRecapViewOptions: MealPlannerRecapViewOptions,
        navigationController: UINavigationController,
        baseViews: BasePageViewParameters
    ) {
        self.mealPlannerRecapViewOptions = mealPlannerRecapViewOptions
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    
    
    
    public override func start() {
        let recapVC = MealPlannerRecapPurchaseViewController(
            mealPlannerRecapViewOptions: mealPlannerRecapViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recapVC, animated: false)
    }
}
