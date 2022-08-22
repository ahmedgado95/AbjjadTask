//
//  AvailableCurrenciesInteractor.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation

protocol AvailableCurrenciesInteractorDependenciesProtocol {
    var dataSource: AvailableCurrenciesInteractorDataSourceProtocol { get }
}

final class AvailableCurrenciesInteractor {
    
    // MARK: - Property
    
    weak var output: AvailableCurrenciesInteractorOutput?
    private let orderedCategories: [AvailableCurrenciesCategory] = [
    ]
    
    private var dataSource: AvailableCurrenciesInteractorDataSourceProtocol
    private let mainQueue = DispatchQueue.main
    
    // MARK: - Lifecycle
    
    init(dependencies: AvailableCurrenciesInteractorDependenciesProtocol) {
        dataSource = dependencies.dataSource
    }
    
    deinit {}
    
    // MARK: - Privates
    
    private func notifyNetworkError() {
        mainQueue.async { [weak self] in
            self?.output?.notifyNetworkError()
        }
    }
    
    private func notifyServerError() {
        mainQueue.async { [weak self] in
            self?.output?.notifyServerError()
        }
    }
}

// MARK: - AvailableCurrenciesInteractorInput

extension AvailableCurrenciesInteractor: AvailableCurrenciesInteractorInput {
    func retrieve() {
        dataSource.availableCurrencies = ["BTC" , "LTC" , "ETH" ]
        output?.setDefaultValues()
        output?.notifyLoading()
        output?.updateList()
    }
    func numberOfCategories() -> Int {
        1
    }
    
    func numberOfItems(for categoryIndex: Int) -> Int {
        dataSource.availableCurrencies.count
    }
    
    func item(atIndex index: Int, for categoryIndex: Int) -> AvailableCurrenciesItemProtocol?{
        let item = dataSource.availableCurrencies[index]
        return AvailableCurrenciesItem(name: item)
    }
    
    func selectItem(atIndex index: Int, for categoryIndex: Int) {
        output?.didTabInList(index)
    }
    
 
}


// MARK: - AvailableCurrenciesItemProtocol

private struct AvailableCurrenciesItem: AvailableCurrenciesItemProtocol {
    var name: String
}
