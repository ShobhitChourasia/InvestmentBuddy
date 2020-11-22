//
//  UIViewController+CustomView.swift
//  InvestmentBuddy
//
//  Created by Shobhit on 22/11/20.
//  Copyright © 2020 Shobhit. All rights reserved.
//

import UIKit

open class CustomViewController<View: UIView>: UIViewController {
    
    // MARK: - Properties
    
    public var customView: View {
        view as! View
    }
    
    // MARK: - Life Cycle
    
    override open func loadView() {
        view = View(frame: UIScreen.main.bounds)
    }
    
}
