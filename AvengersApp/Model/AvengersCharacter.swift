//
//  Character.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//

import Foundation

class AvengersCharacter {
    var image: String? = nil
    var name: String = ""
    var description: String = ""
    
    init(image: String,name: String,description: String) {
        self.image = image
        self.name = name
        self.description = description
        
    }
}
