//
//  MakeRootNav.swift
//  NY_Times
//
//  Created by Mohammed Essam on 6/15/20.
//  Copyright © 2020 ElhayesGroup. All rights reserved.
//

import UIKit

class MakeRootNav{
    func addNavToVC(_ vc:UIViewController)->UINavigationController{
        let nav=UINavigationController(rootViewController: vc)
        nav.navigationBar.barTintColor = #colorLiteral(red: 0.2725717723, green: 0.8898935318, blue: 0.7545517087, alpha: 1)
        nav.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)

        return nav
    }
}

