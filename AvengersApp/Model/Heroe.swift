//
//  Heroes.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//

import Foundation

typealias Heroes = [Heroe]

class Heroe: AvengersCharacter {
    
    override init (image: String, name: String, description: String) {
        super.init(image: image,name: name,description: description)
    }
    
}

/*struct Heroe {
    var image: String? = nil
    var name: String = ""
    var description: String = ""
}*/
