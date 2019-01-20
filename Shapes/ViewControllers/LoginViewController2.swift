//
//  LoginViewController2.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

// LoginViewController2
class LoginViewController2: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - View Life Cycle
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupContinerView()
    }
    
    func setupContinerView(){
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 13.0
    }
}


