//
//  HomeViewController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class HomeViewController: CustomViewController<HomeView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.title = "Home"
    }

}
