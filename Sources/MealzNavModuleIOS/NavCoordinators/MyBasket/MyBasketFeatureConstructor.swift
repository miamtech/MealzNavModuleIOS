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
    let myProductsViewOptions: MyProductsViewOptions
    let myProductsBaseViews: BasePageViewParameters
    let navigateToCatalog: () -> Void
    let navigateToCheckout: (String?) -> Void
    
    // grid configs
    let catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        myBasketViewOptions: MyBasketViewOptions = MyBasketViewOptions(),
        myBasketBaseViews: BasePageViewParameters = BasePageViewParameters(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(nestedOptions: NestedMyMealsViewOptions()),
        myMealsBaseViews: BasePageViewParameters = BasePageViewParameters(),
        myProductsViewOptions: MyProductsViewOptions = MyProductsViewOptions(),
        myProductsBaseViews: BasePageViewParameters = BasePageViewParameters(),
        catalogRecipesListGridConfig: CatalogRecipesListGridConfig = myMealsDefaultRecipesListGridConfig,
        navigateToCatalog: @escaping () -> Void,
        navigateToCheckout: @escaping (String?) -> Void
    ) {
        self.myBasketViewOptions = myBasketViewOptions
        self.myBasketBaseViews = myBasketBaseViews
        self.myMealsViewOptions = myMealsViewOptions
        self.myMealsBaseViews = myMealsBaseViews
        self.myProductsViewOptions = myProductsViewOptions
        self.myProductsBaseViews = myProductsBaseViews
        self.catalogRecipesListGridConfig = catalogRecipesListGridConfig
        self.navigateToCatalog = navigateToCatalog
        self.navigateToCheckout = navigateToCheckout
    }
}
