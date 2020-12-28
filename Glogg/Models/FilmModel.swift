//
//  FilmModel.swift
//  Glogg
//
//  Created by Murtaza on 29/12/2020.
//  Copyright © 2020 Murtaza. All rights reserved.
//

import Foundation
import SwiftyJSON

class FilmModel: NSObject {
    
    var filmId: Int = 0
    var filmName: String = ""
    var filmProducer: String = ""
    var filmImage: String = ""
    
    func updateModelWithJSON(json: JSON){
        filmId = json["episode_id"].intValue
        filmName = json["title"].stringValue
        filmProducer = json["producer"].stringValue
    }
    
}
