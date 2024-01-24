//
//  BaseNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import Foundation
import MealzUIModuleIOS
import UIKit

@available(iOS 14, *)
public protocol BaseNavCoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    var baseViews: BasePageViewParameters { get set }
    
    var parent: BaseNavCoordinatorProtocol? {get set}
    var children: [BaseNavCoordinatorProtocol] {get set}
    
    func start()
    func goBack()
    
    
}
