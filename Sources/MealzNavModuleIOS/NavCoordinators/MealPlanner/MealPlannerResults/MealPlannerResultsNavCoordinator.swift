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
public class MealPlannerResultsNavCoordinator : MealPlannerResultsNavCoordinatorProtocol {
    public var navigationController: UINavigationController
    
    public var parent: BaseNavCoordinatorProtocol?
    public var children: [BaseNavCoordinatorProtocol] = [BaseNavCoordinatorProtocol] ()
    
    
    public var mealPlannerResultsViewOptions: MealPlannerResultsViewOptions
    public var baseViews: BasePageViewParameters
    
    var viewCOntrollerRef: UIViewController?

    
    
    init(navigationController: UINavigationController,
         mealPlannerResultsViewOptions: MealPlannerResultsViewOptions,
         baseViews: BasePageViewParameters
    ) {
        self.navigationController = navigationController
        self.mealPlannerResultsViewOptions = mealPlannerResultsViewOptions
        self.baseViews = baseViews
    }
        
    
    
    public func start() {
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
        
/*        let recipePickerVC = MealPlannerRecipePickerViewController(
            indexOfRecipe: indexOfRecipe,
            mealPlannerRecipePickerViewOptions: mealPlannerRecipePickerViewOptions,
            baseViews: baseViews,
            coordinator: self)
        navigationController.pushViewController(recipePickerVC, animated: false)*/
    }
    
    public func goBack() {
        
    }
    
}
