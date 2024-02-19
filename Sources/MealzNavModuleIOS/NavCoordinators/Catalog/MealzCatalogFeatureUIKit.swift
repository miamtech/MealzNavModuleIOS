//
//  MealzCatalogFeatureUIKit.swift
//  
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit
import MealzUIModuleIOS
import MiamIOSFramework

@available(iOS 14, *)
public class MealzCatalogFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: CatalogFeatureNavCoordinator = {
        return CatalogFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            catalogFeatureConstructor: catalogFeatureConstructor,
            myMealsViewOptions: myMealsViewOptions,
            myMealsRecipesListGridConfig: myMealsRecipesListGridConfig,
            mealPlannerCoordinator: MealPlannerFeatureNavCoordinator(
                baseConstructor: MealzBaseNavCoordinator.Constructor(
                    navigationController: self
                ),
                recipeDetailsConstructor: recipeDetailsConstructor,
                mealPlannerFeatureConstructor: mealPlannerFeatureConstructor
            )
        )
    }()
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let catalogFeatureConstructor: CatalogFeatureConstructor
    private let myMealsViewOptions: MyMealsViewOptions
    private let myMealsRecipesListGridConfig: CatalogRecipesListGridConfig
    private let mealPlannerFeatureConstructor: MealPlannerFeatureConstructor
    
    public init(
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
        myMealsRecipesListGridConfig: CatalogRecipesListGridConfig = CatalogRecipesListGridConfig(),
        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.catalogFeatureConstructor = catalogFeatureConstructor
        self.myMealsViewOptions = myMealsViewOptions
        self.myMealsRecipesListGridConfig = myMealsRecipesListGridConfig
        self.mealPlannerFeatureConstructor = mealPlannerFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setCatalog()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public func openCatalogResults(catalogId: String?, categoryTitle: String?) {
        self.coordinator.setCatalog() // reset the stack (so we don't have 10 results pages)
        self.coordinator.showCatalogResults(catalogId: catalogId, categoryTitle: categoryTitle)
    }
}
