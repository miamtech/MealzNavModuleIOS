//
//  MealzRecipeDetailsFeatureUIKit.swift
//
//
//  Created by miam x didi on 15/02/2024.
//

import Foundation
import UIKit

@available(iOS 14, *)
public class MealzRecipeDetailsFeatureUIKit: UINavigationController {
    
    private var recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private var rootCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    public init(recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor()) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
            let coordinator = RecipeDetailsFeatureNavCoordinator(
                baseConstructor: MealzBaseNavCoordinator.Constructor(
                    navigationController: self
                ),
                recipeDetailsFeatureConstructor: recipeDetailsConstructor
            )
            
            self.rootCoordinator = coordinator
    }
    
    func showRecipeDetails(recipeId: String) {
        self.rootCoordinator?.setRecipeDetails(recipeId: recipeId)
    }
}
