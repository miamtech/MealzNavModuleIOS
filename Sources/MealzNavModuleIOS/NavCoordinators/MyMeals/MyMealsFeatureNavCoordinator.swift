//
//  MyMealsFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class MyMealsFeatureNavCoordinator: RecipeDetailsFeatureNavCoordinator, MyMealsFeatureNavCoordinatorProtocol {
    public var myMealsViewOptions: MyMealsViewOptions
    public var navigateToCatalog: () -> Void
    
    init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        myMealsViewOptions: MyMealsFeatureConstructor
    ) {
        self.myMealsViewOptions = myMealsViewOptions.myMealsViewOptions
        self.navigateToCatalog = myMealsViewOptions.navigateToCatalog
        super.init(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor
        )
    }
    
    public func showMyMeals() {
        let myMealsVC = MyMealsViewController(
            myMealsViewOptions: myMealsViewOptions,
            baseViews: baseViews,
            coordinator: self,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.pushViewController(myMealsVC, animated: false)
    }
}
