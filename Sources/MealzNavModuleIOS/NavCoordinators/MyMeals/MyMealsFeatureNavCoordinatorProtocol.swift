//
//  MyMealsFeatureNavCoordinatorProtocol.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import SwiftUI
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public protocol MyMealsFeatureNavCoordinatorProtocol {
    var baseViews: BasePageViewParameters { get set }
    var myMealsViewOptions: MyMealsViewOptions { get set }
    var navigateToCatalog: () -> Void { get set }
    
    // grid configs
    var catalogRecipesListGridConfig: CatalogRecipesListGridConfig { get set }
    
    func setMyMeals()
}
