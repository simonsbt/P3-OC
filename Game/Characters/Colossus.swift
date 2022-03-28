//
//  Colossus.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation


class Colossus: Character {
    init(name: String) {
        super.init(name: name, hp: 100, weapon: Club(), heal: false)
    }
}
