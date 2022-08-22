//
//  ChartInteractorModuleFactoryProtocol.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public protocol ChartInteractorModuleFactoryProtocol {
  var output: ChartInteractorOutput? { get set }
  func makeResponse(from request: ChartInteractorModuleFactoryRequestProtocol) -> ChartInteractorModuleFactoryResponseProtocol
}

public protocol ChartInteractorModuleFactoryRequestProtocol {
}

public protocol ChartInteractorModuleFactoryResponseProtocol {
  var interactor: ChartInteractorInput { get }
}
