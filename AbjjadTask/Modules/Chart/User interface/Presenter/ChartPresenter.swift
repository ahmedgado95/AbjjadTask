//
//  ChartPresenter.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

protocol ChartPresenterDependenciesProtocol {
    var interactor: ChartInteractorInput { get }
    var router: ChartRouterProtocol { get }
}

final class ChartPresenter {
    
    // MARK: - Properties
    
    weak var output: ChartPresenterOutput?
    private let interactor: ChartInteractorInput
    private let router: ChartRouterProtocol
    
    // MARK: - Lifecycle
    
    init(dependencies: ChartPresenterDependenciesProtocol) {
        interactor = dependencies.interactor
        router = dependencies.router
    }
    
    // MARK: - Privates
    
}

// MARK: - ChartPresenterInput

extension ChartPresenter: ChartPresenterInput {
    func textDidChange(_ index: Int) {
        interactor.textChange(index)
    }
    
    func viewDidLoad() {
        interactor.retrieve()
        interactor.chartData()
    }
}

// MARK: - ChartInteractorOutput

extension ChartPresenter: ChartInteractorOutput {
    func setTitleName(_ title: String) {
        output?.displayTitle(title)
    }
    
    func notifyChartData(_ chart: Chart) {
        output?.displayChart(chart)
    }
    
    func setDefaultValues() {
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
