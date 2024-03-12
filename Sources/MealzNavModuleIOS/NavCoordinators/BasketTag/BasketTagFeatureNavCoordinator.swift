//
//  BasketTagFeatureNavCoordinator.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import Foundation
import MealzUIModuleIOS
import miamCore
import MiamIOSFramework
import UIKit
import SwiftUI

@available(iOS 14, *)
public class BasketTagFeatureNavCoordinator: MealzBaseNavCoordinator, BasketTagFeatureNavCoordinatorProtocol {
    public var baseViews: BaseComponentViewParameters
    public var basketTagViewOptions: BasketTagViewOptions
    
    private var recipeDetailsView: MealzRecipeDetailsFeatureUIKit
    
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
        self.recipeDetailsView = MealzRecipeDetailsFeatureUIKit(
            recipeDetailsConstructor: recipeDetailsConstructor)
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
        navigationController.present(recipeDetailsView, animated: true)
        recipeDetailsView.showRecipeDetails(recipeId: recipeId)
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeTapped))
        recipeDetailsView.navigationBar.topItem?.rightBarButtonItem = closeButton
    }
    
    @objc func closeTapped() {
        // Dismiss the navigation controller
        navigationController.dismiss(animated: true, completion: nil)
    }
}
