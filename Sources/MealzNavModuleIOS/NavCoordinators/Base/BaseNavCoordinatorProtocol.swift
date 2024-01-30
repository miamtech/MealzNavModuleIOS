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
    
    func goBack()
}
