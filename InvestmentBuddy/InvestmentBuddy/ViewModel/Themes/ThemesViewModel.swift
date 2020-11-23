//
//  ThemesViewModel.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 23/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import Foundation

protocol ThemesViewModelOutput {
    func getThemesData()
    
    var themes: Observable<[Themes]> { get }
}

protocol ThemesViewModelProtocol: ThemesViewModelOutput { }

class ThemesViewModel: ThemesViewModelProtocol {
    
    var themes: Observable<[Themes]> = Observable([])

    init() { }
    
    func getThemesData() {
        guard let themesData = loadJson(filename: "ThemesData") else { return }
        themes.value = themesData
    }
        
    
    func loadJson(filename fileName: String) -> [Themes]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ThemesData.self, from: data)
                return jsonData.themes
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

}


struct Themes: Decodable {
    let title: String
    let image: String
}

struct ThemesData: Decodable {
    var themes: [Themes]
}
