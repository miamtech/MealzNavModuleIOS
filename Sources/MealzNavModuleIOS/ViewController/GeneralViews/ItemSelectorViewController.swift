//
//  ItemSelectorViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 7/4/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS

@available(iOS 14, *)
class ItemSelectorViewController: UIViewController {
    private let ingredientId: String
    private let itemSelectorViewOptions: ItemSelectorViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: MealzBaseNavCoordinator?
    
    init(
        ingredientId: String,
        itemSelectorViewOptions: ItemSelectorViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: MealzBaseNavCoordinator?
    ) {
        self.ingredientId = ingredientId
        self.itemSelectorViewOptions = itemSelectorViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // Your SwiftUI View
    var swiftUIView: ItemSelector<
        ItemSelectorParameters,
        BasePageViewParameters
    > {
        return ItemSelector(
            params: ItemSelectorParameters(
                actions: ItemSelectorActions(
                    onItemSelected: { [weak self] in
                        // added small delay to ensure image reloads
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {
                            guard let strongSelf = self else { return }
                            strongSelf.coordinator?.goBack()
                        }
                    }, onSeeProductDetails: { _ in }),
                viewOptions: itemSelectorViewOptions
            ),
            baseViews: baseViews,
            ingredientId: ingredientId)
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<ItemSelector<
        ItemSelectorParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Mon assistant Budget repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
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
