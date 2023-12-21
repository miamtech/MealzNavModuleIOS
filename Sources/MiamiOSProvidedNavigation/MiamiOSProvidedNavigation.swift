import UIKit
import SwiftUI

@available(iOS 14, *)
public struct MiamiOSProvidedNavigation {
    public private(set) var text = "Hello, World!"
    private let useMealPlanner: Bool
    public init(
        useMealPlanner: Bool
    ) {
        self.useMealPlanner = useMealPlanner
    }
    
    public func present(in viewController: UIViewController) {
        let yourVC = CatalogViewController(useMealPlanner: useMealPlanner)
        let navVC = UINavigationController(rootViewController: yourVC)
        viewController.present(navVC, animated: true, completion: nil)
    }
}

@available(iOS 14, *)
public struct CatalogViewControllerWrapper: UIViewControllerRepresentable {
    private let useMealPlanner: Bool
    public init(
        useMealPlanner: Bool
    ) {
        self.useMealPlanner = useMealPlanner
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        let catalogVC = CatalogViewController(useMealPlanner: useMealPlanner)
        let navController = UINavigationController(rootViewController: catalogVC)
        return navController
    }

    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update the UIController if needed
    }
}

