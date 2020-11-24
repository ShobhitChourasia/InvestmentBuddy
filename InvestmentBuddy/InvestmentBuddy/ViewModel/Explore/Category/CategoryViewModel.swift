//
//  CategoryViewModel.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 23/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import Foundation

protocol CategoryViewModelOutput {
    func getCategoryData()
    
    var category: Observable<[Category]> { get }
}

protocol CategoryViewModelProtocol: CategoryViewModelOutput { }

class CategoryViewModel: CategoryViewModelProtocol {
    
    var category: Observable<[Category]> = Observable([])

    init() { }
    
    func getCategoryData() {
        guard let categoryData = loadJson(filename: "CategoryData") else { return }
        category.value = categoryData
    }
        
    
    func loadJson(filename fileName: String) -> [Category]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(CategoryData.self, from: data)
                return jsonData.categories
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

}
