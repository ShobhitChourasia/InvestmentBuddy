//
//  TrendingViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class TrendingViewController: CustomViewController<TrendingView> {
    
    var viewModel = TrendingViewModel()
    
    private var trendingData: Trending?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.getTrendingData()
    }
    
}

private extension TrendingViewController {
    func bindViewModel() {
        viewModel.trending.observe(on: self) { [weak self] in
            guard let data = $0 else { return }
            self?.reloadTableView(trendingData: data)
        }
    }
    
    func reloadTableView(trendingData: Trending) {
        self.trendingData = trendingData
    }
}

private typealias TableViewHelper = TrendingViewController
extension TableViewHelper: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        customView.tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "trendingCell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return trendingData?.trending.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingData?.trending[section].data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trendingCell") as? TrendingTableViewCell,
        let data = trendingData?.trending[indexPath.section].data[indexPath.row] else {  return UITableViewCell() }
        cell.setData(company: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 8, width: tableView.frame.width, height: 50))
        sectionView.backgroundColor = .white
        
        let headerTitle = UILabel(frame: CGRect(x: 16, y: 20, width: sectionView.frame.width - 16, height: 20))
        headerTitle.text = trendingData?.trending[section].header
        headerTitle.textColor = .black
        headerTitle.backgroundColor = .white
        headerTitle.font = UIFont.init(name: "Verdana-Bold", size: 14)
        
        sectionView.addSubview(headerTitle)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}
