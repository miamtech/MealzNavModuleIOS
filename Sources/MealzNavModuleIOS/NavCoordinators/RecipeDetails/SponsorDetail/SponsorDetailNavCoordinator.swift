//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 25/01/2024.
//

import Foundation
import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class SponsorDetailNavCoordinator: MealzBaseNavCoordinator, SponsorDetailNavCoordinatorProtocol  {
    
    init(navigationController: UINavigationController,
         baseViews: BasePageViewParameters
    ){
        super.init(constructor: Constructor(navigationController: navigationController, baseViews: baseViews))
    }
    public func showSponsorDetails(
        sponsor: Sponsor
    ) {
        let sponsorDetailsVC = SponsorDetailsViewController(
            sponsor: sponsor,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(sponsorDetailsVC, animated: true)
    }
}
