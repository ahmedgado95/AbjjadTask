//
//  AvailableCurrenciesRouter.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

open class AvailableCurrenciesRouter {
    
    // MARK: - Property
    
    public weak var viewController: UIViewController?
    
    // MARK: - Lifecycle
    
    public init() { }
}

// MARK: - AvailableCurrenciesRouterProtocol

extension AvailableCurrenciesRouter: AvailableCurrenciesRouterProtocol {
    public func goToChart(_ index: Int) {
        let dependencies = ChartModuleFactoryDependencies(interactorFactory: ChartInteractorModuleFactory())
        let moduleFactory = ChartModuleFactory(dependencies: dependencies)
        let controller = moduleFactory.makeView() as! ChartViewController
        controller.chartIndex = index
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - ChartModuleFactoryDependenciesProtocol

private struct ChartModuleFactoryDependencies: ChartModuleFactoryDependenciesProtocol {
    var interactorFactory: ChartInteractorModuleFactoryProtocol
}
