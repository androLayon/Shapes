//
//  LoginPresenter.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

protocol LoginPresenterDelegate {
    
    func fetchUserData(email: String?, password: String?)
    func isValid( _ email: String, _ password: String) -> Bool
}

class LoginPresenter: LoginPresenterDelegate {
    
    var view: LoginViewDelegate?
    
    init(view: LoginViewDelegate) {
        
        self.view = view
    }
    
    func fetchUserData(email: String?, password: String?){
        
        let data = UserInfo(mobileNumber: "+97056991523")
        
        WebServiceManager.checkValidation(userInfo: data) { (isSuccess, user) in
            
            if isSuccess {
                
                self.view?.loginAction()
            } else {
                
                self.view?.errorMessage()
            }
        }
    }
    
    func isValid( _ email: String, _ password: String) -> Bool{
        
        return email.isValidRegex(ValidationRegex.EMAIL.rawValue) && !(password.isEmpty)
    }
}
