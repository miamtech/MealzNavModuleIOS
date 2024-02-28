//
//  MealzMyMealsFeatureUIKit.swift
//  
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit

@available(iOS 14, *)
public class MealzMyMealsFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: MyMealsFeatureNavCoordinator = {
        return MyMealsFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            myMealsContructor: myMealsContructor
        )
    }()
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let myMealsContructor: MyMealsFeatureConstructor
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        myMealsContructor: MyMealsFeatureConstructor
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.myMealsContructor = myMealsContructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setMyMeals()
        // Hide the navigation bar
        self.isNavigationBarHidden = hideTitles
        self.view.backgroundColor = UIColor.white 
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
