//
//  MealzBasketTagFeatureUIKit.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import UIKit
import miamCore
import SwiftUI

@available(iOS 14, *)
public class MealzBasketTagFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: BasketTagFeatureNavCoordinator = {
        return BasketTagFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            basketTagFeatureConstructor: basketTagFeatureConstructor
        )
    }()
    
    private let basketTagFeatureConstructor: BasketTagFeatureConstructor
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    
    public init(
        retailerProductId: String,
        scrollAlignment: Axis.Set = .horizontal,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        basketTagFeatureConstructor: BasketTagFeatureConstructor = BasketTagFeatureConstructor()
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.basketTagFeatureConstructor = basketTagFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setBasketTag(retailerProductId: retailerProductId, scrollAlignment: scrollAlignment)
    }
   
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Hide the navigation bar
        self.isNavigationBarHidden = true
//        self.preferredContentSize = CGSize(width: recipeDimensions.width, height: recipeDimensions.height)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
