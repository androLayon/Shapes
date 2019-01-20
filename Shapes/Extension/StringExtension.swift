//
//  StringExtension.swift
//  HarriTask
//
//  Created by hadeel on 1/18/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

enum ValidationRegex:String {

    case EMAIL            = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}" //developers@yamsafer.me
}

extension String {
    
    func isValidRegex(_ regex: String) -> Bool {
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: self)
    }
}
