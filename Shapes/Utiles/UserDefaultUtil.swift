//
//  UserDefaultUtil.swift
//  HarriTask
//
//  Created by hadeel on 1/18/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

public struct UserDefaultsKeys {
    
    public static let USER                                      = "USER"
}

class UserDefaultUtil: NSObject {
    
    static var userDefaults : UserDefaults = UserDefaults.standard

    class func removeValue(_ key:String?) {
        
        if let key = key {
            
            userDefaults.removeObject(forKey: key)
        }
    }
    
    // set string value to user defauls
    class func setStringValue(_ value : String?, forKey key : String?) {
        
        //check if value and key are not null
        if let value = value, let key = key {
            
           userDefaults.set(value, forKey: key)
            userDefaults.synchronize()
        }
    }
    
    //get string value from user default
    class func getStringValueForKey(_ key : String?) -> String? {
        
        if let key = key {
            
            //get value
            if let value = userDefaults.object(forKey: key) as? String {
                
                return value
            }
        }
        
        return nil
    }
    
    // set Object value to user defauls
    class func setObjectValue(_ value : Any?, forKey key : String?) {
        
        //check if value and key are not null
        if let value = value , let key = key {
            
            userDefaults.set(value, forKey: key)
            userDefaults.synchronize()
        }
    }
    
    //get object value from user default
    class func getObjectValueForKey(_ key : String?) -> Any? {
        
        //check if key is null
        guard let key = key else { return nil }
        
        //get value
        return userDefaults.object(forKey: key)
        
    }
    
    //get data value from user default
    class func getDataValueForKey(_ key : String?) -> Data? {
        
        
        if let key = key {
            
            //get value
            return userDefaults.data(forKey: key)
        }
        return nil
    }
    
    //get Integer value from user default
    class func getIntegerValueForKey(_ key : String?) -> Int? {
        
        //check if key is null
        guard let key = key else { return nil }
        
        //get value
        let value  = userDefaults.integer(forKey: key)
        
        return value
    }
    
    class func setIntegerValue(_ value : Int?,forKey key : String?) {
        
        if let value = value, let key = key{
            
            userDefaults.set(value, forKey: key)
        }
    }
    
    class func setUser(_ user: User) {
        
        let encode = try? JSONEncoder().encode(user)
        
        self.setObjectValue(encode, forKey: UserDefaultsKeys.USER)
        
    }
    
    class func getUserInfo() -> User {

        if let jsonData = self.getObjectValueForKey(UserDefaultsKeys.USER),  let user = try? JSONDecoder().decode(User.self, from: jsonData as? Data ?? Data()) {
    
            return user
        }
        
        return User()
    }
}
