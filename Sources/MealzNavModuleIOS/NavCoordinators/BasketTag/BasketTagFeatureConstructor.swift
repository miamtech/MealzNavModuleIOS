//
//  BasketTagFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct BasketTagFeatureConstructor {
    let baseViews: BaseComponentViewParameters
    let basketTagViewOptions: BasketTagViewOptions
    
    public init(
        baseViews: BaseComponentViewParameters = BaseComponentViewParameters(),
        basketTagViewOptions: BasketTagViewOptions = BasketTagViewOptions()
    ) {
        self.baseViews = baseViews
        self.basketTagViewOptions = basketTagViewOptions
    }
}
