//
//  RequestUtil.swift
//  HarriTask
//
//  Created by hadeel on 1/18/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

enum RequestURL {
    
    case login
}

struct SystemServiceUrls {
    
    static var loginURL = "http://springsheep.sa/api/auth/login"
}

class RequestUtil: NSObject {
    
    /**
     Class function to return system service url strings
     */
    class func getServiceUrlString(_ service : RequestURL) -> String {
        
        switch service {
            
        case .login:
            return SystemServiceUrls.loginURL
        default:
            return ""
        }
    }
}

