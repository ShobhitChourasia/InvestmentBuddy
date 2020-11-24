//
//  Themes.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 23/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

struct Themes: Decodable {
    let title: String
    let image: String
}

struct ThemesData: Decodable {
    var themes: [Themes]
}
