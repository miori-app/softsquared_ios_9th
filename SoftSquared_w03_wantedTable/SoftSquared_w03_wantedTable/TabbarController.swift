//
//  TabbarController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/09.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let viewController = self.viewControllers?[self.selectedIndex] as? UINavigationController else {
            return
        }
        viewController.popToRootViewController(animated: true)
    }
}
