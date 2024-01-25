//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 25/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class MealPlannerBasketNavCoordinator: MealzBaseNavCoordinator, MealPlannerBasketNavCoordinatorProtocol {
    public var mealPlannerBasketViewOptions: MealPlannerBasketViewOptions
    public var basketRecipeViewOptions: BasketRecipeViewOptions
    
    
    init(
        mealPlannerBasketViewOptions: MealPlannerBasketViewOptions,
        basketRecipeViewOptions: BasketRecipeViewOptions,
        navigationController: UINavigationController,
        baseViews: BasePageViewParameters
    ) {
        self.mealPlannerBasketViewOptions = mealPlannerBasketViewOptions
        self.basketRecipeViewOptions = basketRecipeViewOptions
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
        
    }
    
    override func start() {
        let basketVC = MealPlannerBasketViewController(
            mealPlannerBasketViewOptions: mealPlannerBasketViewOptions,
            basketRecipeViewOptions: basketRecipeViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(basketVC, animated: false)
    }
    
    func showMealPlannerRecap() {
        
        
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        
        let mealPlannerRecapNavCoordinator = MealPlannerRecapNavCoordinator(
            mealPlannerRecapViewOptions: mealPlannerFeatureNavCoordinator.mealPlannerRecapViewOptions,
            navigationController: navigationController,
            baseViews: baseViews
            )
            
            
            self.children.append(mealPlannerRecapNavCoordinator)
        mealPlannerRecapNavCoordinator.parent = self
        mealPlannerRecapNavCoordinator.start()
        
        
        
    }
    
    public func showRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        
        let recipeDetailsNavCoordinator = RecipeDetailsNavCoordinator(
            recipeDetailsViewOptions: mealPlannerFeatureNavCoordinator.recipeDetailsViewOptions,
            recipeDetailsProductViewOptions: mealPlannerFeatureNavCoordinator.recipeDetailsProductViewOptions,
            baseViews: baseViews,
            navigationController: navigationController)
            
            
            self.children.append(recipeDetailsNavCoordinator)
        recipeDetailsNavCoordinator.parent = self
        recipeDetailsNavCoordinator.showRecipeDetails(recipeId: recipeId, isForMealPlanner: isForMealPlanner)
        
    }
}
