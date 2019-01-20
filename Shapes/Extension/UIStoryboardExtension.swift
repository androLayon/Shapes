//
//  UIStoryboardExtension.swift
//  HarriTask
//
//  Created by hadeel on 1/19/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    class func loadStoryboard(_ storyboardName: String, viewControllerName: String) -> UIViewController {
        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerName)
    }
}
