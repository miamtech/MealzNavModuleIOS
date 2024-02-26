//
//  MealzFavoritesFeatureUIKit.swift
//  
//
//  Created by miam x didi on 15/02/2024.
//

import UIKit

@available(iOS 14, *)
public class MealzFavoritesFeatureUIKit: UINavigationController {
    
    private lazy var coordinator: FavoritesFeatureNavCoordinator = {
        return FavoritesFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: recipeDetailsConstructor,
            favoritesFeatureConstructor: favoritesFeatureConstructor
        )
    }()
    private let recipeDetailsConstructor: RecipeDetailsFeatureConstructor
    private let favoritesFeatureConstructor: FavoritesFeatureConstructor
    
    public init(
        hideTitles: Bool = false,
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        favoritesFeatureConstructor: FavoritesFeatureConstructor
    ) {
        self.recipeDetailsConstructor = recipeDetailsConstructor
        self.favoritesFeatureConstructor = favoritesFeatureConstructor
        super.init(nibName: nil, bundle: nil)
        self.coordinator.setFavorites()
        // Hide the navigation bar
        self.isNavigationBarHidden = hideTitles
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
