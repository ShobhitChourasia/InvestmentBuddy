//
//  CategoryViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class CategoryViewController: CustomViewController<CategoryView> {

    var viewModel = CategoryViewModel()
    
    private var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.getCategoryData()
    }

}

private extension CategoryViewController {
    func bindViewModel() {
        viewModel.category.observe(on: self) { [weak self] in self?.reloadTableView(categoryData: $0) }
    }
    
    func reloadTableView(categoryData: [Category]) {
        categories = categoryData
    }
}

private typealias TableViewHelper = CategoryViewController
extension TableViewHelper: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        customView.tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryTableViewCell else {  return UITableViewCell() }
        cell.setData(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
