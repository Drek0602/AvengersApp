//
//  Villains.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//

import Foundation

typealias Villains = [Villain]

class Villain: AvengersCharacter {
    
    override init (image: String, name: String, description: String) {
        super.init(image: image,name: name,description: description)
    }
}
