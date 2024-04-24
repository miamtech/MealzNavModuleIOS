//
//  MealzBasketTagFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
public struct MealzBasketTagFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: BasketTagFeatureNavCoordinator
    
    private let retailerProductId: String
    private let scrollAlignment: Axis.Set
    
    public init(
        retailerProductId: String,
        scrollAlignment: Axis.Set = .horizontal,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        basketTagFeatureConstructor: BasketTagFeatureConstructor = BasketTagFeatureConstructor()
    ) {
        self.retailerProductId = retailerProductId
        self.scrollAlignment = scrollAlignment
        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        self.coordinator =  BasketTagFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            basketTagFeatureConstructor: basketTagFeatureConstructor
        )
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        coordinator.setBasketTag(retailerProductId: retailerProductId, scrollAlignment: scrollAlignment)
        if let recipeCarouselViewController = coordinator.navigationController.viewControllers.first {
            return recipeCarouselViewController
        }
        return UIViewController() //Use to prevent crash in case where recipecard cannot be created
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // make sure it has correct size
//        uiViewController.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
}
