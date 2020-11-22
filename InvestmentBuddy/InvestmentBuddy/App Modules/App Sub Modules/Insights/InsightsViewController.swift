//
//  InsightsViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class InsightsViewController: CustomViewController<InsightView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.title = "Insight"
    }

}
