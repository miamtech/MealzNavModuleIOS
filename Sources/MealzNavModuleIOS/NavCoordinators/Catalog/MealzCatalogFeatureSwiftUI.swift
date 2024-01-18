//
//  MealzCatalogFeatureSwiftUI.swift
//
//
//  Created by Diarmuid McGonagle on 17/01/2024.
//

import UIKit
import SwiftUI
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public struct MealzCatalogFeatureSwiftUI: UIViewControllerRepresentable {
    private let coordinator: CatalogFeatureNavCoordinator
    
    public init(
        baseViews: BasePageViewParameters = BasePageViewParameters(),
        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions()
    ) {
        let navController = UINavigationController()
        
        self.coordinator = CatalogFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController,
                baseViews: baseViews
            ),
            recipeDetailsConstructor: RecipeDetailsFeatureConstructor(
                recipeDetailsViewOptions: recipeDetailsConstructor.recipeDetailsViewOptions,
                recipeDetailsProductViewOptions: recipeDetailsConstructor.recipeDetailsProductViewOptions,
                itemSelectorViewOptions: recipeDetailsConstructor.itemSelectorViewOptions
            ),
            catalogFeatureConstructor: CatalogFeatureConstructor(
                catalogViewOptions: catalogFeatureConstructor.catalogViewOptions,
                catalogSearchViewOptions: catalogFeatureConstructor.catalogSearchViewOptions,
                filtersViewOptions: catalogFeatureConstructor.filtersViewOptions,
                preferencesViewOptions: catalogFeatureConstructor.preferencesViewOptions,
                preferencesSearchViewOptions: catalogFeatureConstructor.preferencesSearchViewOptions
            ),
            myMealsViewOptions: myMealsViewOptions
        )
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.showCatalog()
        return coordinator.navigationController
    }
    
    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
        // For example, you can pass data to the coordinator here if needed
    }
}
