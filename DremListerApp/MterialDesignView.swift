//
//  MterialDesignView.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/13/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import UIKit

var materialKey = false

extension UIView {

    @IBInspectable var MaterialDesign:Bool {
        
        get {
            return materialKey
        }
        set {
            materialKey = newValue
            
            if materialKey {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowRadius = 3.0
                self.layer.shadowOpacity = 0.9
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            } else {
                self.layer.shadowColor = nil
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 0
            }
        }
        
    }

}
