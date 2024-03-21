//
//  BasketTagViewController.swift
//
//
//  Created by Diarmuid McGonagle on 12/03/2024.
//

import UIKit
import SwiftUI
import MealzIOSFramework
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
class BasketTagViewController: UIViewController {
    private let retailerProductId: String
    private let basketTagViewOptions: BasketTagViewOptions
    private let baseViews: BaseComponentViewParameters
    private let scrollAlignment: Axis.Set
    weak var coordinator: BasketTagFeatureNavCoordinator?
    
    init(retailerProductId: String,
         basketTagViewOptions: BasketTagViewOptions,
         baseViews: BaseComponentViewParameters,
         scrollAlignment: Axis.Set,
         coordinator: BasketTagFeatureNavCoordinator
    ) {
        self.retailerProductId = retailerProductId
        self.basketTagViewOptions = basketTagViewOptions
        self.baseViews = baseViews
        self.scrollAlignment = scrollAlignment
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        self.coordinator?.viewController = self
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // Your SwiftUI View
    var swiftUIView: BasketTag<
        BasketTagParameters,
        BaseComponentViewParameters
    > {
        return BasketTag.init(
            params: BasketTagParameters(
                actions: BasketTagActions(
                    onShowRecipeDetails: { [weak self] recipeId in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.presentRecipeDetails(recipeId: recipeId)
                }),
                viewOptions: basketTagViewOptions
            ),
            baseViews: baseViews,
            retailerProductId: retailerProductId,
            scrollAlignment: scrollAlignment
        )
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<BasketTag<
        BasketTagParameters,
        BaseComponentViewParameters
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
