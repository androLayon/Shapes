//
//  UserInfo.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

struct UserInfo: Codable {
    
    var mobileNumber: String?
    
    enum CodingKeys: String, CodingKey {
        
        case mobileNumber     = "mobile_no"
    }
}

