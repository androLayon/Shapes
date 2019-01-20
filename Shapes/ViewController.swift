//
//  ViewController.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(set), userInfo: nil, repeats: false)
        
    }
    
    @objc func set() {
        
        let viewController =  UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        let window = UIApplication.shared.windows[0]
        
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        viewController?.view.frame = rootViewController.view.frame
        viewController?.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
        
            window.rootViewController = viewController
       
        }, completion: { completed in
            // maybe do something here
        })
//        window.makeKeyAndVisible()
        
    }
}
