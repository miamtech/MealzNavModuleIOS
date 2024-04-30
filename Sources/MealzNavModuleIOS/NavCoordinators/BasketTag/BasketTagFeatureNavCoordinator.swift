//
//  BasketTagFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import Foundation
import MealzUIModuleIOS
import mealzcore
import MealzIOSFramework
import UIKit
import SwiftUI

@available(iOS 14, *)
public class BasketTagFeatureNavCoordinator: MealzBaseNavCoordinator, BasketTagFeatureNavCoordinatorProtocol {
    public var baseViews: BaseComponentViewParameters
    public var basketTagViewOptions: BasketTagViewOptions
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit? = nil
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public var viewController: UIViewController?

    public init(
        baseConstructor: Constructor,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        basketTagFeatureConstructor: BasketTagFeatureConstructor = BasketTagFeatureConstructor()
    ) {
        self.baseViews = basketTagFeatureConstructor.baseViews
        self.basketTagViewOptions = basketTagFeatureConstructor.basketTagViewOptions
        let recipeDetailsCoordinator = RecipeDetailsFeatureNavCoordinator(
            baseConstructor: baseConstructor,
            recipeDetailsFeatureConstructor: recipeDetailsConstructor)
        self.recipeDetailsConstructor = recipeDetailsConstructor
        super.init(constructor: baseConstructor)
    }
    
    public func setBasketTag(retailerProductId: String, scrollAlignment: Axis.Set) {
        let basketTagVC = BasketTagViewController(
            retailerProductId: retailerProductId,
            basketTagViewOptions: basketTagViewOptions,
            baseViews: baseViews,
            scrollAlignment: scrollAlignment,
            coordinator: self
        )
        navigationController.viewControllers = [basketTagVC]
    }
    
    // for using a modal (used on Recipe Card)
    public func presentRecipeDetails(
        recipeId: String
    ) {
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeId: recipeId, recipeDetailsConstructor: self.recipeDetailsConstructor)
        if let recipeDetailsView {
            navigationController.present(recipeDetailsView, animated: true)
            let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
            recipeDetailsView.navigationBar.topItem?.rightBarButtonItem = closeButton
        }
    }
    
    @objc func closeTapped() {
        // Dismiss the navigation controller
        navigationController.dismiss(animated: true, completion: nil)
    }
}
