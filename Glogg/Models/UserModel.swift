//
//  UserModel.swift
//  Glogg
//
//  Created by rahat on 30/12/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: NSObject {
    
    var userId: Int = 0
    var userName: String = ""
    var userAvatar: String = ""
    
    func updateModelWithJSON(json: JSON){
        userId = json["id"].intValue
        userName = json["first_name"].stringValue
        userAvatar = json["avatar"].stringValue
    }
    
}
