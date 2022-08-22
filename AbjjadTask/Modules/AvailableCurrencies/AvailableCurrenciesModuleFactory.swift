//
//  AvailableCurrenciesModuleFactory.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  Copyright ©2022 AbjjadTask. All rights reserved.
//

import UIKit

protocol AvailableCurrenciesModuleFactoryProtocol {
    func makeView() -> UIViewController
}

public protocol AvailableCurrenciesModuleFactoryDependenciesProtocol {
    var interactorFactory: AvailableCurrenciesInteractorModuleFactoryProtocol { get }
}

public final class AvailableCurrenciesModuleFactory: AvailableCurrenciesViewDependenciesProtocol {
    
    // MARK: - Properties
    
    var presenter: AvailableCurrenciesPresenterInput!
    
    private var interactorFactory: AvailableCurrenciesInteractorModuleFactoryProtocol
    
    // MARK: - Lifecycle
    
    public init(dependencies: AvailableCurrenciesModuleFactoryDependenciesProtocol) {
        interactorFactory = dependencies.interactorFactory
    }
    
    // MARK: - Private
    
    private func makeInteractorModuleFactoryResponse() -> AvailableCurrenciesInteractorModuleFactoryResponseProtocol {
        let request = AvailableCurrenciesInteractorModuleFactoryRequest()
        return interactorFactory.makeResponse(from: request)
    }
}

// MARK: - AvailableCurrenciesModuleFactoryProtocol

extension AvailableCurrenciesModuleFactory: AvailableCurrenciesModuleFactoryProtocol {
    func makeView() -> UIViewController {
        let interactorModuleFactoryResponse = makeInteractorModuleFactoryResponse()
        let router = AvailableCurrenciesRouter()
        let presenterDependencies = AvailableCurrenciesPresenterDependencies(interactor: interactorModuleFactoryResponse.interactor, router: router)
        let presenter = AvailableCurrenciesPresenter(dependencies: presenterDependencies)
        
        let viewController = UIStoryboard(name: "AvailableCurrencies", bundle: nil).instantiateViewController(withIdentifier: "AvailableCurrenciesViewController") as! AvailableCurrenciesViewController
        
        viewController.dependencies = self
        self.presenter = presenter
        interactorFactory.output = presenter
        presenter.output = viewController
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - AvailableCurrenciesInteractorModuleFactoryRequestProtocol

private struct AvailableCurrenciesInteractorModuleFactoryRequest: AvailableCurrenciesInteractorModuleFactoryRequestProtocol {
    
}

// MARK: - AvailableCurrenciesPresenterDependenciesProtocol

private struct AvailableCurrenciesPresenterDependencies: AvailableCurrenciesPresenterDependenciesProtocol {
    let interactor: AvailableCurrenciesInteractorInput
    let router: AvailableCurrenciesRouterProtocol
}
