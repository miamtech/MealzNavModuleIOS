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
    
    public var parent: BaseNavCoordinatorProtocol?
    public var children = [BaseNavCoordinatorProtocol]()
    public struct Constructor {
        let navigationController: UINavigationController
        let baseViews: BasePageViewParameters
        
        public init(navigationController: UINavigationController, baseViews: BasePageViewParameters) {
            self.navigationController = navigationController
            self.baseViews = baseViews
        }
    }

    public init(
        constructor: Constructor
    ) {
        self.navigationController = constructor.navigationController
        self.baseViews = constructor.baseViews
    }
    
    public func start() { }
    
    public func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    public func findParent<T>(classType: T.Type) -> T? {
        var p = parent
        while(p != nil) {
            if p is T {
                return p as! T
            }
            p = p?.parent
        }
        return nil
    }
}
