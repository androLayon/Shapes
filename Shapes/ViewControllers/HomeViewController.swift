//
//  HomeViewController.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: parameters
    //Stored parameters
    var presenter:HomePresenter?
    
    //IBOutlet parameters
    @IBOutlet weak var label: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = HomePresenter(view: self, user: UserDefaultUtil.getUserInfo())
    }
    
    // MARK: Button action
    @IBAction func logoutButtonClicked(_ sender: Any) {

        presenter?.logout()
    }
}

// MARK: implement HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    
    func presentData(userName: String?, userEmail: String?) {
    
        self.label.text = userName ?? "Just Hi"
    }
    
    func logout() {
       
        SceneRouter.presentLoginViewController()
    }
}
