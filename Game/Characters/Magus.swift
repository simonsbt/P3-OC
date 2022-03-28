//
//  Magus.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation

class Magus: Character {
    init(name: String) {
        super.init(name: name, hp: 80, weapon: Stick(), heal: true)
    }
}
