//
//  MealzMyBasketFeatureUIKit.swift
//
//
//  Created by Antonin Francois on 28/03/2024.
//

import UIKit

@available(iOS 14, *)
public class MealzMyBasketFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: MyBasketFeatureNavCoordinator = {
        return MyBasketFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            myBasketContructor: myBasketContructor
        )
    }()
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let myBasketContructor: MyBasketFeatureConstructor
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myBasketContructor: MyBasketFeatureConstructor
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.myBasketContructor = myBasketContructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setMyBasket()
        // Hide the navigation bar
        self.isNavigationBarHidden = hideTitles
        self.view.backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
