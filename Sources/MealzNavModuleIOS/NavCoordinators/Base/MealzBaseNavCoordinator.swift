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
    public var baseViews: BasePageViewParameters
    
    public struct Constructor {
        let navigationController: UINavigationController
        let baseViews: BasePageViewParameters
    }

    init(
        constructor: Constructor
    ) {
        self.navigationController = constructor.navigationController
        self.baseViews = constructor.baseViews
    }
    
    public func goBack() {
        navigationController.popViewController(animated: true)
    }
}
