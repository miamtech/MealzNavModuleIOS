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
        navigationController.popViewController(animated: true)
    }
}
