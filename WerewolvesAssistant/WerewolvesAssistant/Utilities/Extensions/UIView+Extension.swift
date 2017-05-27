//
//  UIView+Extension.swift
//  BestaMall
//
//  Created by Jun on 2016/12/20.
//  Copyright © 2016年 Juku Tech. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public class func instantiateFromNib() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as! UIView
    }
    
    func findController() -> UIViewController? {
        return self.findControllerWithClass(clzz: UIViewController.self)
    }
    
    func findNavigator() -> UINavigationController? {
        return self.findControllerWithClass(clzz: UINavigationController.self)
    }
    
    private func findControllerWithClass<T>(clzz: AnyClass) -> T? {
        var responder = self.next
        while(responder != nil) {
            if (responder?.isKind(of: clzz))! {
                return responder as? T
            }
            responder = responder?.next
        }
        
        return nil
    }

}
