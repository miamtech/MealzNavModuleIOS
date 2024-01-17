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
        baseViews: BaseViewParameters = BaseViewParameters(),
        recipeDetailsViewOptions: RecipeDetailsViewOptions = RecipeDetailsViewOptions(),
        recipeDetailsProductViewOptions: RecipeDetailsProductViewOptions = RecipeDetailsProductViewOptions(),
        itemSelectorViewOptions: ItemSelectorViewOptions = ItemSelectorViewOptions(),
        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor()
    ) {
        let navController = UINavigationController()
        
        self.coordinator = CatalogFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: navController,
              baseViews: baseViews,
              recipeDetailsViewOptions: recipeDetailsViewOptions,
              recipeDetailsProductViewOptions: recipeDetailsProductViewOptions,
                itemSelectorViewOptions: itemSelectorViewOptions
            ),
            catalogFeatureConstructor: CatalogFeatureConstructor(
                catalogViewOptions: catalogFeatureConstructor.catalogViewOptions,
                catalogSearchViewOptions: catalogFeatureConstructor.catalogSearchViewOptions,
                filtersViewOptions: catalogFeatureConstructor.filtersViewOptions,
                preferencesViewOptions: catalogFeatureConstructor.preferencesViewOptions,
                preferencesSearchViewOptions: catalogFeatureConstructor.preferencesSearchViewOptions,
                myMealsViewOptions: catalogFeatureConstructor.myMealsViewOptions)
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
