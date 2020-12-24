//
//  UIView+Extensions.swift
//  Music Player
//
//  Created by Shanu on 23/12/20.
//  Copyright © 2020 Shanu. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func addShadow1() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.5
        self.clipsToBounds = false
    }
    func addShadowNote() {
         self.layer.shadowColor = UIColor.lightGray.cgColor
         self.layer.shadowOffset = CGSize(width: 0, height: 1)
         self.layer.shadowOpacity = 1
         self.layer.shadowRadius = 1
         self.clipsToBounds = false
     }
    
    func removeShadow() {
         self.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         self.layer.shadowOffset = CGSize(width: 0, height: 1)
         self.layer.shadowOpacity = 1
         self.layer.shadowRadius = 1
         self.clipsToBounds = false
     }
    
    
}
