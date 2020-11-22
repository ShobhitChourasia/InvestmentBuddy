//
//  ExploreViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class ExploreViewController: CustomViewController<ExploreView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.title = "Explore"
        
        addChild(customView.pagingView)
        customView.pagingView.didMove(toParent: self)
    }
    
}
