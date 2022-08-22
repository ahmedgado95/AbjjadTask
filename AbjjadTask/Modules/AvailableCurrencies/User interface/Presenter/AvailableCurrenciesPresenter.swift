//
//  AvailableCurrenciesPresenter.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

protocol AvailableCurrenciesPresenterDependenciesProtocol {
    var interactor: AvailableCurrenciesInteractorInput { get }
    var router: AvailableCurrenciesRouterProtocol { get }
}

final class AvailableCurrenciesPresenter {
    // MARK: - Constants
    
    private enum Constants {
        static let nameColor: UIColor = .white
        static let title  = "Symbols"
        static let  cornerRadius: CGFloat  = 12.0
    }
    // MARK: - Properties
    
    weak var output: AvailableCurrenciesPresenterOutput?
    private let interactor: AvailableCurrenciesInteractorInput
    private let router: AvailableCurrenciesRouterProtocol
    
    // MARK: - Lifecycle
    
    init(dependencies: AvailableCurrenciesPresenterDependenciesProtocol) {
        interactor = dependencies.interactor
        router = dependencies.router
    }
    
    // MARK: - Privates
    
}

// MARK: - AvailableCurrenciesPresenterInput

extension AvailableCurrenciesPresenter: AvailableCurrenciesPresenterInput {
    func numberOfSections() -> Int {
        interactor.numberOfCategories()
    }
    
    func numberOfRows(at section: Int) -> Int {
        interactor.numberOfItems(for: section)
    }
    
    func viewItem(at indexPath: IndexPath) -> AvailableCurrenciesViewItemProtocol? {
        guard let item = interactor.item(atIndex: indexPath.row, for: indexPath.section) else{return nil}
        
        let attributesName = [ NSAttributedString.Key.foregroundColor : Constants.nameColor]
        let name = NSAttributedString(string: item.name , attributes:attributesName )
        return AvailableCurrenciesViewItem(name: name)
    }
    
    func selectItem(at indexPath: IndexPath) {
        interactor.selectItem(atIndex: indexPath.row, for: indexPath.section)
    }
    
    func viewDidLoad() {
        interactor.retrieve()
    }
}

// MARK: - AvailableCurrenciesInteractorOutput

extension AvailableCurrenciesPresenter: AvailableCurrenciesInteractorOutput {
    func didTabInList(_ index: Int) {
        router.goToChart(index)
    }
    
    func updateList() {
        output?.reloadData()
    }
    
    func setDefaultValues() {
        output?.display(Constants.title, Constants.cornerRadius)
    }
    
    func notifyLoading() {
        output?.showLoading()
    }
    
    func notifyNoDataError() {
        output?.hideLoading()
    }
    
    func notifyNetworkError() {
        output?.hideLoading()
    }
    
    func notifyServerError() {
        output?.hideLoading()
    }
}

// MARK: - AvailableCurrenciesViewItemProtocol

private struct AvailableCurrenciesViewItem :AvailableCurrenciesViewItemProtocol {
    var name: NSAttributedString
}
