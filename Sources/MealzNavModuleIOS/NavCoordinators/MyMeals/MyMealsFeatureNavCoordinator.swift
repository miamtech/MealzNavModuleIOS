//
//  MyMealsFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 18/01/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework

@available(iOS 14, *)
public class MyMealsFeatureNavCoordinator: MealzBaseNavCoordinator, MyMealsFeatureNavCoordinatorProtocol {
    public var baseViews: BasePageViewParameters
    public var myMealsViewOptions: MyMealsViewOptions
    public var navigateToCatalog: () -> Void
    
    public var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    
    // grid configs
    public var catalogRecipesListGridConfig: CatalogRecipesListGridConfig
    
    init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor,
        myMealsViewOptions: MyMealsFeatureConstructor
    ) {
        self.baseViews = myMealsViewOptions.baseViews
        self.myMealsViewOptions = myMealsViewOptions.myMealsViewOptions
        self.navigateToCatalog = myMealsViewOptions.navigateToCatalog
        self.catalogRecipesListGridConfig = myMealsViewOptions.catalogRecipesListGridConfig
        self.recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        super.init(constructor: baseConstructor)
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
