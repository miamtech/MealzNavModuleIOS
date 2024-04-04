//
//  MyBasketFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Antonin Francois on 28/03/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MealzIOSFramework

@available(iOS 14, *)
public protocol MyBasketFeatureNavCoordinatorProtocol {
    var myBasketViewOptions: MyBasketViewOptions { get set }
    var myBasketBaseViews: BasePageViewParameters { get set }
    var myMealsViewOptions: MyMealsViewOptions { get set }
    var myMealsBaseViews: BasePageViewParameters { get set }
    var navigateToCatalog: () -> Void { get set }

    // grid configs
    var catalogRecipesListGridConfig: CatalogRecipesListGridConfig { get set }

    func showMyBasket()
}
