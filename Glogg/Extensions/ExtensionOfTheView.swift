//
//  ExtensionOfTheView.swift
//  Glogg
//
//  Created by Murtaza on 06/11/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func roundCorners(radius: Float){
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
    }
    
}
