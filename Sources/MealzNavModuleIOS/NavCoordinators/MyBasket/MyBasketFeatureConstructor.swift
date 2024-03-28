//
//  MyBasketFeatureConstructor.swift
//  
//
//  Created by Antonin Francois on 28/03/2024.
//

import Foundation
import MealzUIModuleIOS
import MealzIOSFramework

@available(iOS 14, *)
public struct MyBasketFeatureConstructor {
    let myBasketViewOptions: MyBasketViewOptions
    let myBasketBaseViews: BasePageViewParameters
    let myMealsViewOptions: MyMealsViewOptions
    let myMealsBaseViews: BasePageViewParameters
    let navigateToCatalog: () -> Void
    
    // grid configs
    let catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        myBasketViewOptions: MyBasketViewOptions = MyBasketViewOptions(),
        myBasketBaseViews: BasePageViewParameters = BasePageViewParameters(),
        nestedMyMealsViewOptions: NestedMyMealsViewOptions = NestedMyMealsViewOptions(),
        myMealsBaseViews: BasePageViewParameters = BasePageViewParameters(),
        catalogRecipesListGridConfig: CatalogRecipesListGridConfig = myMealsDefaultRecipesListGridConfig,
        navigateToCatalog: @escaping () -> Void
    ) {
        self.myBasketViewOptions = myBasketViewOptions
        self.myBasketBaseViews = myBasketBaseViews
        self.myMealsViewOptions = MyMealsViewOptions(nestedOptions: nestedMyMealsViewOptions)
        self.myMealsBaseViews = myMealsBaseViews
        self.catalogRecipesListGridConfig = catalogRecipesListGridConfig
        self.navigateToCatalog = navigateToCatalog
    }
}
