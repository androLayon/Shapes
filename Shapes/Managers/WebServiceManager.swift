//
//  WebServiceManager.swift
//  HarriTask
//
//  Created by hadeel on 1/18/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation
import Alamofire

class WebServiceManager {
    
    class func checkValidation(userInfo: UserInfo, completeHandler:  @escaping (_ isSuccess: Bool, _ result : User?) -> ()) {
        
        let requestUrlString = RequestUtil.getServiceUrlString(.login)
        
        guard let urlRequest = URL(string: requestUrlString), let body = try? JSONEncoder().encode(userInfo) else {
            completeHandler(false, nil)
            return
        }
        
        var parameters = Parameters()
        parameters.updateValue("+97056991523", forKey: "mobile_no")
        
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

//        request = try! JSONEncoding.default.encode(request, with: parameters)
        
        Alamofire.request(request)
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(let data):
                    
                    guard let dicData = data as? NSDictionary, let dataDic = dicData["data"] as? NSDictionary else { return }
                    
                    let user = User(dictionary: dataDic)
                    UserDefaultUtil.setUser(user)
                    completeHandler(true, user)
                    
                    break
                default:
                   break
                    
                }
        }
    }
}

