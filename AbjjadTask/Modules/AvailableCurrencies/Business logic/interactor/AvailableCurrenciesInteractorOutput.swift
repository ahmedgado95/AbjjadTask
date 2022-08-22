//
//  AvailableCurrenciesInteractorOutput.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

public protocol AvailableCurrenciesInteractorOutput: AnyObject {
    func setDefaultValues()
    func notifyLoading()
    func notifyNoDataError()
    func notifyNetworkError()
    func notifyServerError()
    func updateList()
    func didTabInList(_ index: Int)
}
