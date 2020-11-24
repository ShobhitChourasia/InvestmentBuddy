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
        setupTabBarControllers()
        customizeNavBar()
    }

}

private typealias TabBarSetup = RootTabBarController
private extension TabBarSetup {
    
    func setupTabBar() {
        view.backgroundColor = .white
    }
    
    func setupTabBarControllers() {
        let homeViewController = HomeViewController()
        let homeIcon = UITabBarItem(title: nil, image: UIImage(named: "home"), tag: 0)
        homeViewController.tabBarItem = homeIcon
        
        let exploreViewController = ExploreViewController()
        let exploreIcon = UITabBarItem(title: "", image: UIImage(named: "search"), tag: 1)
        exploreViewController.tabBarItem = exploreIcon
        
        let portfolioViewController = PortfolioViewController()
        let trendIcon = UITabBarItem(title: "", image: UIImage(named: "trend"), tag: 2)
        portfolioViewController.tabBarItem = trendIcon
        
        let communityViewController = CommunityViewController()
        let communityIcon = UITabBarItem(title: "", image: UIImage(named: "community"), tag: 3)
        communityViewController.tabBarItem = communityIcon
        
        let insightViewController = InsightsViewController()
        let insightIcon = UITabBarItem(title: "", image: UIImage(named: "insight"), tag: 4)
        insightViewController.tabBarItem = insightIcon
        
        let controllers = [homeViewController, exploreViewController, portfolioViewController, communityViewController, insightViewController]
        viewControllers = controllers
    }
    
    func customizeNavBar() {
        let menuButton = UIButton(type: UIButton.ButtonType.system)
        menuButton.tintColor = .black
        menuButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        menuButton.setImage(UIImage(named: "menu"), for: UIControl.State())
        let menuBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.leftBarButtonItems = [menuBarButtonItem]
        
        let alertsButton = UIButton(type: UIButton.ButtonType.system)
        alertsButton.tintColor = .black
        alertsButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        alertsButton.setImage(UIImage(named: "bell"), for: UIControl.State())
        let alertsBarButtonItem = UIBarButtonItem(customView: alertsButton)
        navigationItem.rightBarButtonItems = [alertsBarButtonItem]
    }
}

