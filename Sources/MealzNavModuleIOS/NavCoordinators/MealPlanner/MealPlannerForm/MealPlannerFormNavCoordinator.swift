//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 23/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore


@available(iOS 14, *)
public class MealPlannerFormNavCoordinator : MealPlannerFormNavCoordinatorProtocol {
    public var navigationController: UINavigationController
    
    public var parent: BaseNavCoordinatorProtocol?
    public var children: [BaseNavCoordinatorProtocol] = [BaseNavCoordinatorProtocol]()
    
    public var mealPlannerFormViewOptions: MealPlannerFormViewOptions
    public var mealPlannerResultsViewOptions : MealPlannerResultsViewOptions
    public var baseViews: BasePageViewParameters
    
    var viewCOntrollerRef: UIViewController?
    
    
    init(navigationController: UINavigationController,
         mealPlannerFormViewOptions: MealPlannerFormViewOptions,
         mealPlannerResultsViewOptions : MealPlannerResultsViewOptions,
         baseViews: BasePageViewParameters
    ){
        self.navigationController = navigationController
        self.mealPlannerFormViewOptions = mealPlannerFormViewOptions
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.baseViews = baseViews
    }
    
    
    public func start() {
        let formVC = MealPlannerFormViewController(
            mealPlannerFormViewOptions: mealPlannerFormViewOptions,
            baseViews: baseViews, coordinator: self)
        self.viewCOntrollerRef = formVC
        navigationController.pushViewController(formVC, animated: true)
    }
    
    public func showMealPlannerResults() {
        let mealPlannerResultsNavCoordinator = MealPlannerResultsNavCoordinator(navigationController: self.navigationController, mealPlannerResultsViewOptions: mealPlannerResultsViewOptions, baseViews: baseViews)
        self.children.append(mealPlannerResultsNavCoordinator)
        mealPlannerResultsNavCoordinator.parent = self
        mealPlannerResultsNavCoordinator.start()
    }
    
    public func goBack() {
    }
    

    
}
