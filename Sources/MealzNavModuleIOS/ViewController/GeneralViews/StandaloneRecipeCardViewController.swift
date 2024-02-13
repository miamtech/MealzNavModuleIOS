//
//  StandaloneRecipeCardViewController.swift
//
//
//  Created by miam x didi on 13/02/2024.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class StandaloneRecipeCardViewController: UIViewController {
    public let recipeCard: TypeSafeCatalogRecipeCard
    public let recipeCardLoading: TypeSafeRecipeCardLoading
    public let recipeCardDimensions: CGSize
    public let criteria: SuggestionsCriteria?
    public let recipe: Recipe?
    public let recipeId: String?
    weak var coordinator: StandaloneRecipeCardNavCoordinator?
    weak var recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator?
    
    init(
        recipe: Recipe,
        recipeCard: TypeSafeCatalogRecipeCard,
        recipeCardLoading: TypeSafeRecipeCardLoading,
        recipeCardDimensions: CGSize,
        coordinator: StandaloneRecipeCardNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    ) {
        self.recipe = recipe
        self.recipeId = recipe.id
        self.criteria = nil
        
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.recipeCardDimensions = recipeCardDimensions
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(
        criteria: SuggestionsCriteria,
        recipeCard: TypeSafeCatalogRecipeCard,
        recipeCardLoading: TypeSafeRecipeCardLoading,
        recipeCardDimensions: CGSize,
        coordinator: StandaloneRecipeCardNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    ) {
        self.recipe = nil
        self.recipeId = nil
        self.criteria = criteria
        
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.recipeCardDimensions = recipeCardDimensions
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(
        recipeId: String,
        recipeCard: TypeSafeCatalogRecipeCard,
        recipeCardLoading: TypeSafeRecipeCardLoading,
        recipeCardDimensions: CGSize,
        coordinator: StandaloneRecipeCardNavCoordinator,
        recipeDetailsCoordinator: RecipeDetailsFeatureNavCoordinator
    ) {
        self.recipe = nil
        self.recipeId = recipeId
        self.criteria = nil
        
        self.recipeCard = recipeCard
        self.recipeCardLoading = recipeCardLoading
        self.recipeCardDimensions = recipeCardDimensions
        self.coordinator = coordinator
        self.recipeDetailsCoordinator = recipeDetailsCoordinator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
        
    // Your SwiftUI View
    var swiftUIView: CatalogRecipeCard<
        TypeSafeCatalogRecipeCard,
        TypeSafeRecipeCardLoading
    > {
        // callback bc all CTAs show recipeDetails
        let onShowRecipeDetails: (String) -> Void = { [weak self] recipeId in
            guard let strongSelf = self else { return }
            strongSelf.recipeDetailsCoordinator?.presentRecipeDetails(recipeId: recipeId)
        }
        if let recipe {
            return CatalogRecipeCard(
                recipe,
                numberOfGuests: nil,
                recipeCardDimensions: recipeCardDimensions,
                cardTemplate: recipeCard,
                loadingTemplate: recipeCardLoading,
                onShowRecipeDetails: onShowRecipeDetails,
                onCallToAction: onShowRecipeDetails)
        } else if let criteria {
            return CatalogRecipeCard(
                criteria: criteria,
                numberOfGuests: nil,
                recipeCardDimensions: recipeCardDimensions,
                cardTemplate: recipeCard,
                loadingTemplate: recipeCardLoading,
                onShowRecipeDetails: onShowRecipeDetails,
                onCallToAction: onShowRecipeDetails)
        } else {
            return CatalogRecipeCard(
                recipeId ?? "", // passing "" should never happen
                numberOfGuests: nil,
                recipeCardDimensions: recipeCardDimensions,
                cardTemplate: recipeCard,
                loadingTemplate: recipeCardLoading,
                onShowRecipeDetails: onShowRecipeDetails,
                onCallToAction: onShowRecipeDetails)
        }
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CatalogRecipeCard<
        TypeSafeCatalogRecipeCard,
        TypeSafeRecipeCardLoading
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
    }
}
