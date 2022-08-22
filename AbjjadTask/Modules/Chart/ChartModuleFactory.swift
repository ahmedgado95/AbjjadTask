//
//  ChartModuleFactory.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  Copyright ©2022 AbjjadTask. All rights reserved.
//

import UIKit

protocol ChartModuleFactoryProtocol {
    func makeView() -> UIViewController
}

public protocol ChartModuleFactoryDependenciesProtocol {
    var interactorFactory: ChartInteractorModuleFactoryProtocol { get }
}

public final class ChartModuleFactory: ChartViewDependenciesProtocol {
    
    // MARK: - Properties
    
    var presenter: ChartPresenterInput!
    
    private var interactorFactory: ChartInteractorModuleFactoryProtocol
    
    // MARK: - Lifecycle
    
    public init(dependencies: ChartModuleFactoryDependenciesProtocol) {
        interactorFactory = dependencies.interactorFactory
    }
    
    // MARK: - Private
    
    private func makeInteractorModuleFactoryResponse() -> ChartInteractorModuleFactoryResponseProtocol {
        let request = ChartInteractorModuleFactoryRequest()
        return interactorFactory.makeResponse(from: request)
    }
}

// MARK: - ChartModuleFactoryProtocol

extension ChartModuleFactory: ChartModuleFactoryProtocol {
    func makeView() -> UIViewController {
        let interactorModuleFactoryResponse = makeInteractorModuleFactoryResponse()
        let router = ChartRouter()
        let presenterDependencies = ChartPresenterDependencies(interactor: interactorModuleFactoryResponse.interactor, router: router)
        let presenter = ChartPresenter(dependencies: presenterDependencies)
        
        let viewController = UIStoryboard(name: "Chart", bundle: nil).instantiateViewController(withIdentifier: "ChartViewController") as! ChartViewController
        viewController.dependencies = self
        self.presenter = presenter
        interactorFactory.output = presenter
        presenter.output = viewController
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - ChartInteractorModuleFactoryRequestProtocol

private struct ChartInteractorModuleFactoryRequest: ChartInteractorModuleFactoryRequestProtocol {
    
}

// MARK: - ChartPresenterDependenciesProtocol

private struct ChartPresenterDependencies: ChartPresenterDependenciesProtocol {
    let interactor: ChartInteractorInput
    let router: ChartRouterProtocol
}
