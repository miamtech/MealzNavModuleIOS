//
//  CatalogFiltersViewController.swift
//  SampleMiamUIKitIntegration
//
//  Created by didi on 07/08/2023.
//
import UIKit
import SwiftUI
import MealzIOSFramework
import MealzUIModuleIOS
import mealzcore

@available(iOS 14, *)
class MealzFiltersViewController: UIViewController {
    private let filterInstance: FilterInstance
    private let filtersViewOptions: FiltersViewOptions
    weak var coordinator: MealzBaseNavCoordinator?
    private let nextNavigationEvent: () -> Void
    
    init(
        _ filterInstance: FilterInstance,
        filtersViewOptions: FiltersViewOptions,
        coordinator: MealzBaseNavCoordinator?,
        nextNavigationEvent: @escaping () -> Void
    ) {
        self.filterInstance = filterInstance
        self.nextNavigationEvent = nextNavigationEvent
        self.filtersViewOptions = filtersViewOptions
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // Your SwiftUI View
    var swiftUIView: Filters<
        FiltersParameters> {
        return Filters.init(
            params: FiltersParameters(
                actions: FiltersActions(
                    onClosed: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.coordinator?.goBack()
                    }, onApplied: { [weak self] in
                        guard let strongSelf = self else { return }
                        strongSelf.nextNavigationEvent()
                    }
                ),
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
        navigationItem.title = NSLocalizedString("filters_title", bundle: .mealzNavBundle, comment: "Title for the FILTERS screen")
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
