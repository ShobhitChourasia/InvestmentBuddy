//
//  TrendingViewModel.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 24/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import Foundation

protocol TrendingViewModelOutput {
    func getTrendingData()
    
    var trending: Observable<Trending?> { get }
}

protocol TrendingViewModelProtocol: TrendingViewModelOutput { }

class TrendingViewModel: TrendingViewModelProtocol {
    
    var trending: Observable<Trending?> = Observable(nil)

    init() { }
    
    func getTrendingData() {
        guard let trendingData = loadJson(filename: "TrendingData") else { return }
        trending.value = trendingData
    }
        
    
    func loadJson(filename fileName: String) -> Trending? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Trending.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

}

