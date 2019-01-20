//
//  SceneRouter.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    
    case home = "HomeStoryboard"
    case splash = "Splash"
    case login = "LoginStoryboard"

}


enum MainViewControllers: String {
    
    case splashViewController = "SplashViewController"
    case loginViewController2 = "LoginViewController"
    case homeViewController   = "HomeViewController"
}

class SceneRouter {
    
    class func presentSplashViewController(window: UIWindow?) {
        
        guard let splashViewController = UIStoryboard.loadStoryboard(StoryboardName.splash.rawValue, viewControllerName: MainViewControllers.splashViewController.rawValue) as? SplashViewController else {return}
        
        showViewController(window: window, viewController: splashViewController, withAnimation: false)
        
    }
    
    class func presentLoginViewController() {
     
        guard let LoginViewController = UIStoryboard.loadStoryboard(StoryboardName.login.rawValue, viewControllerName: MainViewControllers.loginViewController2.rawValue) as? LoginViewController else {return}
        
        showViewController(viewController: LoginViewController, withAnimation: true)
        
    }
    
    class func presentHomeScreenViewController() {
       
        guard let homeViewController = UIStoryboard.loadStoryboard(StoryboardName.home.rawValue, viewControllerName: MainViewControllers.homeViewController.rawValue) as? HomeViewController else {return}
        
        showViewController(viewController: homeViewController, withAnimation: true)
    }
}

func showViewController(window: UIWindow? = nil, viewController: UIViewController, withAnimation:  Bool) {
    
    let window = UIApplication.shared.keyWindow ?? window

    if withAnimation {
        
        UIView.transition(with: window ?? UIWindow(), duration: 0.5, options: .transitionFlipFromLeft, animations: {
            
            window?.rootViewController = viewController
            
        }, completion: { completed in
        })
        
    } else {
       
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    
    }
}
