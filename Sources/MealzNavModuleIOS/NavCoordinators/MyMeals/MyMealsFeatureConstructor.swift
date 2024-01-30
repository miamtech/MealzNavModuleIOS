//
//  MyMealsFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS

@available(iOS 14, *)
public struct MyMealsFeatureConstructor {
    let baseViews: BasePageViewParameters
    let myMealsViewOptions: MyMealsViewOptions
    let navigateToCatalog: () -> Void
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        navigateToCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.navigateToCatalog = navigateToCatalog
    }
}
