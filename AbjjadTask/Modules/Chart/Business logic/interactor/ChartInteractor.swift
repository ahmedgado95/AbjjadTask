//
//  ChartInteractor.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import Foundation
import Alamofire
protocol ChartInteractorDependenciesProtocol {
    var dataSource: ChartInteractorDataSourceProtocol { get }
}

final class ChartInteractor {
    
    // MARK: - Property
    
    weak var output: ChartInteractorOutput?
    private let orderedCategories: [ChartCategory] = [
    ]
    
    private var dataSource: ChartInteractorDataSourceProtocol
    private let mainQueue = DispatchQueue.main
    
    // MARK: - Lifecycle
    
    init(dependencies: ChartInteractorDependenciesProtocol) {
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

// MARK: - ChartInteractorInput

extension ChartInteractor: ChartInteractorInput {
    func textChange(_ index: Int) {
        switch index {
        case 0 :
            dataSource.urlText = "BTCUSDT"
            output?.setTitleName("BTC/USDT")
        case 1 :
            dataSource.urlText = "LTCUSDT"
            output?.setTitleName("LTC/USDT")
        case 2 :
            dataSource.urlText = "ETHUSDT"
            output?.setTitleName("ETH/USDT")
        default:
            dataSource.urlText = "BTCUSDT"
            output?.setTitleName("BTC/USDT")
        }
        
    }
    
    func chartData() {
        let url = "https://fapi.binance.com/fapi/v1/klines?symbol=\(dataSource.urlText)&interval=15m&limit=100"
        mainQueue.async { [weak self] in
            
            AF.request(url, parameters: nil).validate().responseJSON { response in
                switch response.result {
                case .success:
                    if let jsonData = response.data {
                        let jsonDecoder = JSONDecoder()
                        do {
                            let chart = try jsonDecoder.decode([[ChartModel]].self, from: jsonData)
                            self?.dataSource.chart = chart
                            self?.output?.notifyChartData(chart)
                        }catch let error{
                            print(error.localizedDescription)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func retrieve() {
        output?.setDefaultValues()
        output?.notifyLoading()
    }
}
