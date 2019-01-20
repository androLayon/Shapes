//
//  HomeViewDelegate.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
    
    func presentData(userName: String?, userEmail: String?)
    
    func logout()
}
