//
//  TextFieldProtocol.swift
//  HarriTask
//
//  Created by hadeel on 1/18/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import Foundation

enum TextFieldType {
    
    case email
    case password
}

protocol TextFieldDelegate: class {
    
    func checkValidation(isValid: Bool?)
    func shouldReturn(type: TextFieldType)
}
