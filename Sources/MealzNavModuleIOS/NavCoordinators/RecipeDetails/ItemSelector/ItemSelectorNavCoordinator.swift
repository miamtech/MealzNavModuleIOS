//
//  File.swift
//  
//
//  Created by Damien Walerowicz on 24/01/2024.
//

import Foundation

import UIKit
import MealzUIModuleIOS
import miamCore

@available(iOS 14, *)
public class ItemSelectorNavCoordinator: ItemSelectorNavCoordinatorProtocol {
    public var itemSelectorViewOptions: ItemSelectorViewOptions
    public var baseViews: BasePageViewParameters
    public var navigationController: UINavigationController
    public var parent: BaseNavCoordinatorProtocol?
    public var children: [BaseNavCoordinatorProtocol] = [BaseNavCoordinatorProtocol]()
    
    public func start() {
        
    }
    
    public func goBack() {
        
    }
    
    
    init(
        itemSelectorViewOptions: ItemSelectorViewOptions,
        baseViews: BasePageViewParameters,
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
        self.itemSelectorViewOptions = itemSelectorViewOptions
        self.baseViews = baseViews
    }
    
    
    public func showItemSelector(
        ingredientId: String
    ) {
        let itemSelectorVC = ItemSelectorViewController(
            ingredientId: ingredientId,
            itemSelectorViewOptions: itemSelectorViewOptions,
            baseViews: baseViews,
            coordinator: self
        )
        navigationController.pushViewController(itemSelectorVC, animated: true)
    }
    
}
