//
//  SplashViewController.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(set), userInfo: nil, repeats: false)
        
    }

    // check 
    @objc func set() {
                
        if UserDefaultUtil.getUserInfo().token.isEmpty != false{
        
            SceneRouter.presentLoginViewController()
            
        } else {

            SceneRouter.presentHomeScreenViewController()
        }
    }
}
