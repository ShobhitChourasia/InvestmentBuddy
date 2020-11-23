//
//  ExploreView.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit
import Parchment

class ExploreView: UIView {

    let categoryView = CategoryViewController()
    let themesView = ThemesViewController()
    let trendingView = TrendingViewController()
    
    var pagingView: PagingViewController = {
        let view = PagingViewController()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        categoryView.title = "Category"
        themesView.title = "Themes"
        trendingView.title = "Trending"
        
        pagingView = PagingViewController(viewControllers: [categoryView,
                                                            themesView,
                                                            trendingView])
        pagingView.view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pagingView.view)
        
        NSLayoutConstraint.activate([
            pagingView.view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pagingView.view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            pagingView.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            pagingView.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
