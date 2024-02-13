//
//  MealzBaseNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import UIKit
import miamCore

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
        // Check if the view controller is part of a navigation stack
        if navigationController.viewControllers.count > 1 {
            // If the view controller is not the root of the navigation stack,
            // pop it from the stack.
            navigationController.popViewController(animated: true)
        } else {
            // If the view controller is presented modally (or not part of a navigation stack),
            // dismiss it.
            navigationController.dismiss(animated: true, completion: nil)
        }
    }
}
