//
//  ChartViewController.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit
import Charts
import Alamofire
protocol ChartViewDependenciesProtocol {
    var presenter: ChartPresenterInput! { get }
}

class ChartViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var chartView: CandleStickChartView!
    // MARK: - Property
    
    var viewsToHideDuringLoading: [UIView] { view.subviews }
    var activityIndicator: UIActivityIndicatorView?
    var dependencies: ChartViewDependenciesProtocol!
    var chartIndex = 0
    var xAxisSalesItemsNames = [String]()
    var xAxisRtSalesItemsNames = [String]()
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dependencies.presenter?.viewDidLoad()
        self.dependencies.presenter.textDidChange(chartIndex)
    }

    
}
// MARK: - ChartPresenterOutput

extension ChartViewController: ChartPresenterOutput {
    func displayTitle(_ title : String) {
        let backButton = UIBarButtonItem()
        backButton.title = title
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func displayChart(_ chart: Chart) {
        var dataEntry = [CandleChartDataEntry]()
        for i in 0..<(chart.first?.count ?? 0) {
            let val = Double(arc4random_uniform(40) + 50)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = arc4random_uniform(2) % 2 == 0
            let data = CandleChartDataEntry.init(x: Double(i), shadowH: val + high, shadowL: val - low, open: even ? val + open : val - open, close: even ? val - close : val + close, icon: nil, data: nil)
            dataEntry.append(data)
        }
       
        let chartDataSet = CandleChartDataSet(entries: dataEntry, label: "")
        let chartData = CandleChartData(dataSets: [chartDataSet])
        chartView.data = chartData
        chartDataSet.increasingFilled = true
        chartDataSet.shadowWidth = 2
        chartDataSet.increasingColor = UIColor(red: 0, green: 209, blue: 255, alpha: 1)
        chartDataSet.decreasingColor = UIColor(red: 1, green: 0.452721417, blue: 0.4301784635, alpha: 1)
        chartDataSet.shadowColorSameAsCandle = true
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
}

// MARK: - ChartPresenterOutput

extension ChartViewController: ChartViewDelegate {
    
}
