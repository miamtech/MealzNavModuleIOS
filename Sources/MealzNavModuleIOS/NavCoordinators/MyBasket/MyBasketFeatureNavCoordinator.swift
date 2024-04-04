//
//  MyBasketFeatureNavCoordinator.swift
//
//
//  Created by Antonin Francois on 28/03/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public class MyBasketFeatureNavCoordinator: MealzBaseNavCoordinator, MyBasketFeatureNavCoordinatorProtocol {
    public var myBasketViewOptions: MyBasketViewOptions
    public var myBasketBaseViews: BasePageViewParameters
    public var myMealsViewOptions: MyMealsViewOptions
    public var myMealsBaseViews: BasePageViewParameters
    public var navigateToCatalog: () -> Void

    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator

    // grid configs
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig

    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myBasketContructor: MyBasketFeatureConstructor
    ) {
        self.myBasketViewOptions = myBasketContructor.myBasketViewOptions
        self.myBasketBaseViews = myBasketContructor.myBasketBaseViews
        self.myMealsViewOptions = myBasketContructor.myMealsViewOptions
        self.myMealsBaseViews = myBasketContructor.myMealsBaseViews
        self.navigateToCatalog = myBasketContructor.navigateToCatalog
        self.catalogRecipesListGridConfig = myBasketContructor.catalogRecipesListGridConfig
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
    }

    // only used when navigation controller is from a Mealz UIKit or SwiftUI standalone
    internal func setMyBasket() {
        let myBasketVC = MyBasketViewController(
            myBasketViewOptions: myBasketViewOptions,
            myBasketBaseViews: myBasketBaseViews,
            myMealsViewOptions: myMealsViewOptions,
            myMealsBaseViews: myMealsBaseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.viewControllers = [myBasketVC]
    }

    public func showMyBasket() {
        let myBasketVC = MyBasketViewController(
            myBasketViewOptions: myBasketViewOptions,
            myBasketBaseViews: myBasketBaseViews,
            myMealsViewOptions: myMealsViewOptions,
            myMealsBaseViews: myMealsBaseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.pushViewController(myBasketVC, animated: false)
    }
}
