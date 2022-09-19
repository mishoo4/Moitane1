//
//  UIView+Extention.swift
//  uzma
//
//  Created by misho zirakashvili on 08.09.22.
//

import UIKit

extension UIView {
     @IBInspectable var cornerRadius: CGFloat {
         get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
