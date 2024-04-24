//
//  CatalogSearchViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 21/09/2023.
//

import UIKit
import SwiftUI
import MealzIOSFramework
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
class CatalogSearchViewController: UIViewController {
    private let filterInstance: FilterInstance
    private let catalogSearchViewOptions: CatalogSearchViewOptions
    private let baseViews: BasePageViewParameters
    weak var coordinator: CatalogFeatureNavCoordinator?
    
    init(
        _ filterInstance: FilterInstance,
        catalogSearchViewOptions: CatalogSearchViewOptions,
        baseViews: BasePageViewParameters,
        coordinator: CatalogFeatureNavCoordinator
    ) {
        self.filterInstance = filterInstance
        self.catalogSearchViewOptions = catalogSearchViewOptions
        self.baseViews = baseViews
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Your SwiftUI View
    var swiftUIView: CatalogSearch<
        CatalogSearchParameters,
        BasePageViewParameters
    > {
        return CatalogSearch.init(
            params: CatalogSearchParameters(
                actions: CatalogSearchActions(
                    onApplied: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.showCatalogResultsFromSideView(
                            title: NSLocalizedString("search_results_title", bundle: .mealzNavBundle, comment: "Title for the catalog screen")
                        )
                    }
                ),
                viewOptions: catalogSearchViewOptions
            ),
            baseViews: baseViews,
            filterInstance: filterInstance
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CatalogSearch<
        CatalogSearchParameters,
        BasePageViewParameters
    >>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSLocalizedString("search_title", bundle: .mealzNavBundle, comment: "Title for the SEARCH screen")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: NSLocalizedString("return_button", bundle: .mealzNavBundle, comment: "Return Button"), style: .plain, target: nil, action: nil)
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
