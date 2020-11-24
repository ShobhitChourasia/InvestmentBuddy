//
//  Trending.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 24/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

struct Trending: Decodable {
    var trending: [TrendingCategories]
}

struct TrendingCategories: Decodable {
    let header: String
    let data: [TrendingData]
}

struct TrendingData: Decodable {
    let title: String
    let image: String
    let domain: String
    let percentageChange: Float
}

