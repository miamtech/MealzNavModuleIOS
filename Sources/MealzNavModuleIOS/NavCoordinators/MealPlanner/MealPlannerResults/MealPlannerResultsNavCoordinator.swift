//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 23/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class MealPlannerResultsNavCoordinator : MealzBaseNavCoordinator, MealPlannerResultsNavCoordinatorProtocol {
    
    
    public var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    
    var viewCOntrollerRef: UIViewController?

    
    
    init(navigationController: UINavigationController,
         mealPlannerResultsViewOptions: MealPlannerResultsViewOptions,
         baseViews: BasePageViewParameters
    ) {
//        self.navigationController = navigationController
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
//        self.baseViews = baseViews
    }
        
    
    
    override public func start() {
        let resultsVC = MealPlannerResultsViewController(
            mealPlannerResultsViewOptions: mealPlannerResultsViewOptions,
            baseViews: baseViews,
            coordinator: self)
        
        self.viewCOntrollerRef = resultsVC
        navigationController.pushViewController(resultsVC, animated: true)
    }
    
    public func showRecipeDetails(
        recipeId: String,
        isForMealPlanner: Bool = false
    ) {
        
        let recipeDetailsNavCoordinator = RecipeDetailsNavCoordinator(
            recipeDetailsViewOptions: (self.parent?.parent as! MealPlannerFeatureNavCoordinator).recipeDetailsViewOptions,
            recipeDetailsProductViewOptions: (self.parent?.parent as! MealPlannerFeatureNavCoordinator).recipeDetailsProductViewOptions,
            baseViews: baseViews,
            navigationController: navigationController)
            
            
        self.children.append(recipeDetailsNavCoordinator)
        recipeDetailsNavCoordinator.parent = self
        recipeDetailsNavCoordinator.showRecipeDetails(recipeId: recipeId, isForMealPlanner: isForMealPlanner)
        
    }
    
    public func showMealPlannerRecipePicker(indexOfRecipe: Int) {
        //MealPlannerRecipePickerNavCoordinator
        let mealPlannerRecipePickerNavCoordinator = MealPlannerRecipePickerNavCoordinator(mealPlannerRecipePickerViewOptions: (self.parent?.parent as! MealPlannerFeatureNavCoordinator).mealPlannerRecipePickerViewOptions, navigationController: navigationController, baseViews: baseViews)
        
        self.children.append(mealPlannerRecipePickerNavCoordinator)
        mealPlannerRecipePickerNavCoordinator.parent = self
        mealPlannerRecipePickerNavCoordinator.showMealPlannerRecipePicker(indexOfRecipe: indexOfRecipe)
    }
    
    public func showMealPlannerBasket() {
        guard let mealPlannerFeatureNavCoordinator = self.findParent(classType: MealPlannerFeatureNavCoordinator.self) else { return }
        
        let mealPlannerBasketNavCoordinator = MealPlannerBasketNavCoordinator(
            mealPlannerBasketViewOptions: mealPlannerFeatureNavCoordinator.mealPlannerBasketViewOptions,
            basketRecipeViewOptions: mealPlannerFeatureNavCoordinator.basketRecipeViewOptions,
            navigationController: navigationController,
            baseViews: baseViews)
        
        self.children.append(mealPlannerBasketNavCoordinator)
        mealPlannerBasketNavCoordinator.parent = self
        mealPlannerBasketNavCoordinator.start()
    }
    
    override public func goBack() {
        
    }
    
}
