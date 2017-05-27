//
//  STINavigationController.swift
//  WerewolvesAssistant
//
//  Created by Jun on 2017/5/27.
//  Copyright © 2017年 Jun. All rights reserved.
//

import UIKit

class STINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            let backButtonItem = UIBarButtonItem()
            backButtonItem.title = " "
            viewController.navigationItem.backBarButtonItem = backButtonItem;
        }
        
        super.pushViewController(viewController, animated: animated)
    }

}
