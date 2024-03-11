//
//  RecipeCarouselViewController.swift
//
//
//  Created by Diarmuid McGonagle on 11/03/2024.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class RecipeCarouselViewController: UIViewController {
    private let recipeCarouselViewOptions: RecipeCarouselViewOptions
    private let baseViews: BasePageViewParameters
    private let criteria: SuggestionsCriteria?
    private let productId: String?
    private let numberOfResults: Int
    private let gridConfig: RecipesCarouselGridConfig
    weak var coordinator: RecipeCarouselFeatureNavCoordinator?
    
    init(
        productId: String? = nil,
        criteria: SuggestionsCriteria? = nil,
        numberOfResults: Int = 4,
        recipeCarouselViewOptions: RecipeCarouselViewOptions,
        baseViews: BasePageViewParameters,
        gridConfig: RecipesCarouselGridConfig,
        coordinator: RecipeCarouselFeatureNavCoordinator
    ) {
        self.productId = productId
        self.criteria = criteria
        if productId == nil && criteria == nil {
            LogHandler.companion.error("You must pass in a productId or criteria for the recipe carousel")
        }
        
        self.numberOfResults = numberOfResults
        self.recipeCarouselViewOptions = recipeCarouselViewOptions
        self.baseViews = baseViews
        self.gridConfig = gridConfig
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.coordinator?.viewController = self
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        
    // Your SwiftUI View
    var swiftUIView: RecipeCarousel<
        RecipeCarouselParameters,
        BasePageViewParameters
    > {
       
        let onShowRecipeDetails: (String) -> Void = { [weak self] recipeId in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.presentRecipeDetails(recipeId: recipeId)
        }
        if let productId {
            return RecipeCarousel(
                params: RecipeCarouselParameters(
                    actions: RecipeCarouselActions(
                    onShowRecipeDetails: onShowRecipeDetails,
                    onRecipeCallToActionTapped: onShowRecipeDetails),
                     viewOptions: recipeCarouselViewOptions),
                baseViews: baseViews,
                gridConfig: gridConfig,
                numberOfResults: numberOfResults,
                productId: productId
            )
        } else if let criteria {
            return RecipeCarousel(
                params: RecipeCarouselParameters(
                    actions: RecipeCarouselActions(
                    onShowRecipeDetails: onShowRecipeDetails,
                    onRecipeCallToActionTapped: onShowRecipeDetails),
                     viewOptions: recipeCarouselViewOptions),
                baseViews: baseViews,
                gridConfig: gridConfig,
                numberOfResults: numberOfResults,
                criteria: criteria
            )
        } else {
            return RecipeCarousel(
                params: RecipeCarouselParameters(
                    actions: RecipeCarouselActions(
                    onShowRecipeDetails: onShowRecipeDetails,
                    onRecipeCallToActionTapped: onShowRecipeDetails),
                     viewOptions: recipeCarouselViewOptions),
                baseViews: baseViews,
                gridConfig: gridConfig,
                numberOfResults: 0,
                productId: "" // this should never happen
            )
        }
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<RecipeCarousel<
        RecipeCarouselParameters,
        BasePageViewParameters
    >>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the hosting controller with your SwiftUI view
        hostingController = UIHostingController(rootView: swiftUIView)
        guard let hostingController = hostingController, let hcView = hostingController.view
        else { return }
        // Since hostingController is optional, using guard to safely unwrap its view
        hcView.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        view.addSubview(hcView)
        NSLayoutConstraint.activate([
            hcView.topAnchor.constraint(equalTo: view.topAnchor),
            hcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hcView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hcView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        hostingController.didMove(toParent: self)
        hcView.backgroundColor = .clear
    }
}
