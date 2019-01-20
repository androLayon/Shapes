//
//  User.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var id: Int
    var name: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case id          = "id"
        case name        = "name"
        case token       = "api_token"
    }
    
    init(){
        
        self.id = 0
        self.name = ""
        self.token = ""
    }
    
    init(dictionary: NSDictionary) {
        
        self.init()
        
        if let value = dictionary.value(forKey: CodingKeys.id.rawValue) as? Int  {
            
            self.id = value
            
        }
        
        if let value = dictionary.value(forKey: CodingKeys.name.rawValue) as? String {
            
            self.name = value
            
        }
        
        if let value = dictionary.value(forKey: CodingKeys.token.rawValue) as? String {
            
            self.token = value
        }
    }
}

struct DataToken: Codable {
    
    var token : String?
    
    enum CodingKeys: String, CodingKey {
        case token     =  "api_token"
    }
    
    init(dictionary: NSDictionary) {
        
        if let value = dictionary.value(forKey: CodingKeys.token.rawValue) as? String  {
            
            self.token = value
            
        }
        
    }
}
