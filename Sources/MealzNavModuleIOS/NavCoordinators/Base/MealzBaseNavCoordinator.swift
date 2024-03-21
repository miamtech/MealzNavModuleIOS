//
//  MealzBaseNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import UIKit
import mealzcore

@available(iOS 14, *)
public class MealzBaseNavCoordinator: BaseNavCoordinatorProtocol {
    public var navigationController: UINavigationController
    
    public struct Constructor {
        let navigationController: UINavigationController
        
        public init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
    }
    
    public init(
        constructor: Constructor
    ) {
        self.navigationController = constructor.navigationController
    }
    
    public func goBack() {
        if navigationController.viewControllers.count > 1 {
            // if currecnt navigation Controller have more than 1 viewcontroller, just pop
            navigationController.popViewController(animated: true)
        } else if (navigationController.presentingViewController != nil) { 
            // navigation was presented
            navigationController.dismiss(animated: true)
        } else{
            if navigationController.navigationController != nil { 
                // current navigation was push in an other navigationcontroller
                navigationController.navigationController?.popViewController(animated: true)
            }
        }
    }
}
