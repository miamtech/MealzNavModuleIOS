////
////  MealzCatalogFeatureSwiftUI.swift
////
////
////  Created by Diarmuid McGonagle on 17/01/2024.
////
//
//import UIKit
//import SwiftUI
//import MealzUIModuleIOS
//import miamCore
//
//@available(iOS 14, *)
//public struct MealzCatalogFeatureSwiftUI: UIViewControllerRepresentable {
//    private let coordinator: CatalogFeatureNavCoordinator
//    
//    public init(
//        useMealPlanner: Bool = false,
//        baseViews: BasePageViewParameters = BasePageViewParameters(),
//        recipeDetailsConstructor: RecipeDetailsFeatureConstructor = RecipeDetailsFeatureConstructor(),
//        catalogFeatureConstructor: CatalogFeatureConstructor = CatalogFeatureConstructor(),
//        myMealsViewOptions: MyMealsViewOptions = MyMealsViewOptions(),
//        mealPlannerFeatureConstructor: MealPlannerFeatureConstructor = MealPlannerFeatureConstructor()
//    ) {
//        let navController = UINavigationController()
//        let baseConstructor = MealzBaseNavCoordinator.Constructor(
//            navigationController: navController,
//            baseViews: baseViews
//        )
//        let recipeDetailsConstructor = RecipeDetailsFeatureConstructor(
//            recipeDetailsViewOptions: recipeDetailsConstructor.recipeDetailsViewOptions,
//            recipeDetailsProductViewOptions: recipeDetailsConstructor.recipeDetailsProductViewOptions,
//            itemSelectorViewOptions: recipeDetailsConstructor.itemSelectorViewOptions
//        )
//        self.coordinator = CatalogFeatureNavCoordinator(
//            baseConstructor: baseConstructor,
//            recipeDetailsConstructor: recipeDetailsConstructor,
//            catalogFeatureConstructor: CatalogFeatureConstructor(
//                useMealPlanner: useMealPlanner,
//                catalogViewOptions: catalogFeatureConstructor.catalogViewOptions,
//                recipesListViewOptions: catalogFeatureConstructor.recipesListViewOptions,
//                packageRowViewOptions: catalogFeatureConstructor.packageRowViewOptions,
//                catalogSearchViewOptions: catalogFeatureConstructor.catalogSearchViewOptions,
//                filtersViewOptions: catalogFeatureConstructor.filtersViewOptions,
//                preferencesViewOptions: catalogFeatureConstructor.preferencesViewOptions,
//                preferencesSearchViewOptions: catalogFeatureConstructor.preferencesSearchViewOptions
//            ),
//            myMealsViewOptions: myMealsViewOptions,
//            mealPlannerCoordinator: MealPlannerFeatureNavCoordinator(
//                baseConstructor: baseConstructor,
//                recipeDetailsConstructor: recipeDetailsConstructor,
//                mealPlannerFeatureConstructor: mealPlannerFeatureConstructor
//            )
//        )
//    }
//    
//    public func makeUIViewController(context: Context) -> UINavigationController {
//        coordinator.showCatalog()
//        return coordinator.navigationController
//    }
//    
//    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
//        // Update the UIController if needed
//        // For example, you can pass data to the coordinator here if needed
//    }
//}
