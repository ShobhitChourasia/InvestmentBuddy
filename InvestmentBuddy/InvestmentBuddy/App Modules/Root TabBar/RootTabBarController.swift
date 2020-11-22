//
//  RootTabBarController.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

}

private typealias TabBarSetup = RootTabBarController
private extension TabBarSetup {
    
    func setupTabBar() {
        let homeViewController = HomeViewController()
        let homeIcon = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        homeViewController.tabBarItem = homeIcon
        
        let exploreViewController = ExploreViewController()
        let exploreIcon = UITabBarItem(title: "", image: UIImage(named: "search"), tag: 1)
        exploreViewController.tabBarItem = exploreIcon
        
        let trendViewController = PortfolioViewController()
        let trendIcon = UITabBarItem(title: "", image: UIImage(named: "trend"), tag: 2)
        trendViewController.tabBarItem = trendIcon
        
        let communityViewController = CommunityViewController()
        let communityIcon = UITabBarItem(title: "", image: UIImage(named: "community"), tag: 3)
        communityViewController.tabBarItem = communityIcon
        
        let insightViewController = InsightsViewController()
        let insightIcon = UITabBarItem(title: "", image: UIImage(named: "insight"), tag: 4)
        insightViewController.tabBarItem = insightIcon
        
        let controllers = [homeViewController, exploreViewController, trendViewController, communityViewController, insightViewController]
        viewControllers = controllers
    }
}

