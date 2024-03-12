//
//  BasketTagFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MiamIOSFramework
import miamCore

@available(iOS 14, *)
public protocol BasketTagFeatureNavCoordinatorProtocol {
    var baseViews: BaseComponentViewParameters { get set }
    var basketTagViewOptions: BasketTagViewOptions { get set }
    
    func setBasketTag(retailerProductId: String, scrollAlignment: Axis.Set)
}
