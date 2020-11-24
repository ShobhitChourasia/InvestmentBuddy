//
//  Category.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 23/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let title: String
    let image: String
}

struct CategoryData: Decodable {
    var categories: [Category]
}
