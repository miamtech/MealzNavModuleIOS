//
//  MyMealsFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework

@available(iOS 14, *)
public class MyMealsFeatureNavCoordinator: MealzBaseNavCoordinator, MyMealsFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var myMealsViewOptions: MyMealsViewOptions
    public var navigateToCatalog: () -> Void
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    // grid configs
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myMealsContructor: MyMealsFeatureConstructor
    ) {
        self.baseViews = myMealsContructor.baseViews
        self.myMealsViewOptions = myMealsContructor.myMealsViewOptions
        self.navigateToCatalog = myMealsContructor.navigateToCatalog
        self.catalogRecipesListGridConfig = myMealsContructor.catalogRecipesListGridConfig
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
    }
    
    // only used when navigation controller is from a Mealz UIKit or SwiftUI standalone
    internal func setMyMeals() {
        let myMealsVC = MyMealsViewController(
            myMealsViewOptions: myMealsViewOptions,
            baseViews: baseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.viewControllers = [myMealsVC]
    }
    
    public func showMyMeals() {
        let myMealsVC = MyMealsViewController(
            myMealsViewOptions: myMealsViewOptions,
            baseViews: baseViews,
            gridConfig: catalogRecipesListGridConfig,
            coordinator: self,
            recipeDetailsCoordinator: recipeDetailsCoordinator,
            navigateToTheCatalog: navigateToCatalog
        )
        navigationController.pushViewController(myMealsVC, animated: false)
    }
}
