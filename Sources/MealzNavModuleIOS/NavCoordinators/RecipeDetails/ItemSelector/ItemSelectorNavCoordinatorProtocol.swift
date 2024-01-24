//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public protocol ItemSelectorNavCoordinatorProtocol: BaseNavCoordinatorProtocol {
    var itemSelectorViewOptions: ItemSelectorViewOptions { get set }
    var baseViews: BasePageViewParameters { get set }
}
