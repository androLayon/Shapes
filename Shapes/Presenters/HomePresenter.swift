//
//  HomePresenter.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

protocol HomePresenterDelegate {
    
   func showData()
   func logout()
}

class HomePresenter: HomePresenterDelegate {
 
    var user: User? {
        
        didSet {
            
           showData()
        }
    }
    
    weak var view: HomeViewDelegate?
    
    init( view: HomeViewDelegate, user: User) {
        
        self.view = view
        self.user = user
    }
    
    func showData() {
        
        self.view?.presentData(userName: self.user?.name, userEmail: "")
    }
    
    func logout() {
        
        UserDefaultUtil.removeValue(UserDefaultsKeys.USER)

        self.view?.logout()
    }
}
