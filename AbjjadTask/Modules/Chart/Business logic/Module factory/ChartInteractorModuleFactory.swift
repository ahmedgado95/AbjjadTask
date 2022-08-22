//
//  ChartInteractorModuleFactory.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public final class ChartInteractorModuleFactory: ChartInteractorModuleFactoryProtocol {

  // MARK: - Property

  public weak var output: ChartInteractorOutput? {
    didSet {
      interactor?.output = output
    }
  }

  private weak var interactor: ChartInteractor?

  // MARK: - Lifecycle

  public init() {}

  // MARK: - ChartInteractorInput

  public func makeResponse(from request: ChartInteractorModuleFactoryRequestProtocol) -> ChartInteractorModuleFactoryResponseProtocol {
    let dependencies = ChartInteractorDependencies(dataSource: ChartInteractorDataSource())
    let interactor = ChartInteractor(dependencies: dependencies)
    self.interactor = interactor
    let response = ChartInteractorModuleFactoryResponse(interactor: interactor)
    return response
  }
}

// MARK: - ChartInteractorModuleFactoryResponseProtocol

private struct ChartInteractorModuleFactoryResponse: ChartInteractorModuleFactoryResponseProtocol {
  let interactor: ChartInteractorInput
}

// MARK: - ChartInteractorDependenciesProtocol

private struct ChartInteractorDependencies: ChartInteractorDependenciesProtocol {
  let dataSource: ChartInteractorDataSourceProtocol
}
