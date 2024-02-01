//
//  MyMealsFeatureConstructor.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public struct MyMealsFeatureConstructor {
    let baseViews: BasePageViewParameters
    let myMealsViewOptions: MyMealsViewOptions
    let navigateToCatalog: () -> Void
    
    // grid configs
    let catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        catalogRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        navigateToCatalog: @escaping () -> Void
    ) {
        self.baseViews = baseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.catalogRecipesListGridConfig = catalogRecipesListGridConfig
        self.navigateToCatalog = navigateToCatalog
    }
}
