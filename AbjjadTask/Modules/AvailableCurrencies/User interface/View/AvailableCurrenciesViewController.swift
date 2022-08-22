//
//  AvailableCurrenciesViewController.swift
//  AbjjadTask
//
//
//  Created by ahmed gado on 19/08/2022.
//  
//

import UIKit

protocol AvailableCurrenciesViewDependenciesProtocol {
    var presenter: AvailableCurrenciesPresenterInput! { get }
}

class AvailableCurrenciesViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Property
    
    var viewsToHideDuringLoading: [UIView] { view.subviews }
    var activityIndicator: UIActivityIndicatorView?
    var dependencies: AvailableCurrenciesViewDependenciesProtocol!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dependencies.presenter?.viewDidLoad()
        setup()
    }
   
    public func setup() {
        tableView.register(UINib(nibName: AvailableCurrenciesTableViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: AvailableCurrenciesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - AvailableCurrenciesPresenterOutput

extension AvailableCurrenciesViewController: AvailableCurrenciesPresenterOutput {
    func display(_ title: String, _ cornerRadius: CGFloat) {
        containerView.layer.cornerRadius = cornerRadius
        navigationItem.title = title
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
}

// MARK: - UITableViewDataSource

extension AvailableCurrenciesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dependencies.presenter.numberOfSections()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dependencies.presenter.numberOfRows(at: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = dependencies.presenter.viewItem(at: indexPath) else {
              return UITableViewCell() }

      guard let cell = tableView.dequeueReusableCell(withIdentifier: AvailableCurrenciesTableViewCell.identifier,
                                                     for: indexPath) as? AvailableCurrenciesTableViewCell else { return UITableViewCell() }
        cell.setName(viewModel.name)

      return cell
    }
}

// MARK: - UITableViewDelegate

extension AvailableCurrenciesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dependencies.presenter.selectItem(at: indexPath)
    }
    
}
