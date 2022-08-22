//
//  AvailableCurrenciesInteractorModuleFactory.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public final class AvailableCurrenciesInteractorModuleFactory: AvailableCurrenciesInteractorModuleFactoryProtocol {

  // MARK: - Property

  public weak var output: AvailableCurrenciesInteractorOutput? {
    didSet {
      interactor?.output = output
    }
  }

  private weak var interactor: AvailableCurrenciesInteractor?

  // MARK: - Lifecycle

  public init() {}

  // MARK: - AvailableCurrenciesInteractorInput

  public func makeResponse(from request: AvailableCurrenciesInteractorModuleFactoryRequestProtocol) -> AvailableCurrenciesInteractorModuleFactoryResponseProtocol {
    let dependencies = AvailableCurrenciesInteractorDependencies(dataSource: AvailableCurrenciesInteractorDataSource())
    let interactor = AvailableCurrenciesInteractor(dependencies: dependencies)
    self.interactor = interactor
    let response = AvailableCurrenciesInteractorModuleFactoryResponse(interactor: interactor)
    return response
  }
}

// MARK: - AvailableCurrenciesInteractorModuleFactoryResponseProtocol

private struct AvailableCurrenciesInteractorModuleFactoryResponse: AvailableCurrenciesInteractorModuleFactoryResponseProtocol {
  let interactor: AvailableCurrenciesInteractorInput
}

// MARK: - AvailableCurrenciesInteractorDependenciesProtocol

private struct AvailableCurrenciesInteractorDependencies: AvailableCurrenciesInteractorDependenciesProtocol {
  let dataSource: AvailableCurrenciesInteractorDataSourceProtocol
}
