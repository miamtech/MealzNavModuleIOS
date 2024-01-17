//
//  CatalogFiltersViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 07/08/2023.
//
import UIKit
import SwiftUI
import MiamIOSFramework
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
class FiltersViewController: UIViewController {
    public let filterInstance: FilterInstance
    public let isForMealPlanner: Bool
    public let filtersViewOptions: FiltersViewOptions
    weak var coordinator: CatalogFeatureNavCoordinator?
    
    init(
        _ filterInstance: FilterInstance,
        isForMealPlanner: Bool = false,
        filtersViewOptions: FiltersViewOptions,
        coordinator: CatalogFeatureNavCoordinator?
    ) {
        self.filterInstance = filterInstance
        self.isForMealPlanner = isForMealPlanner
        self.filtersViewOptions = filtersViewOptions
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("deinit: FiltersViewController")}
    // Your SwiftUI View
    var swiftUIView: Filters<
        FiltersParameters> {
        return Filters.init(
            params: FiltersParameters(
                onApplied: { [weak self] in
                    guard let strongSelf = self else { return }
                    //  if strongSelf.isForMealPlanner {
                    //      strongSelf.navigationController?.popViewController(animated: true)
                    //  } else {
                    strongSelf.coordinator?.showCatalogResults()
                    //  }
                }, onClosed: { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.coordinator?.goBack()
                },
                viewOptions: filtersViewOptions
            ),
            filterInstance: filterInstance
        )
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<Filters<
        FiltersParameters>>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Filters"
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
