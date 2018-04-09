//
//  BaseTabBarController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.shadowImage = UIImage()
    }
}
