//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import UIKit


@available(iOS 14, *)
public class FilterNavCoordinator : MealzBaseNavCoordinator {
    
    
    public init( 
        navigationController: UINavigationController,
        baseViews: BasePageViewParameters
    ) {
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    
    public func showFilters(filterInstance: FilterInstance) {
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        
        
        let filtersVC = FiltersViewController(
            filterInstance,
            filtersViewOptions: mealPlannerFeatureNavCoordinator.filtersViewOptions,
            coordinator: self,
            nextNavigationEvent: self.goBack
        )
        navigationController.pushViewController(filtersVC, animated: true)
    }
    
    
}
