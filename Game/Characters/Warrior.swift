//
//  Warrior.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation


class Warrior: Character {
    init(name: String) {
        super.init(name: name, hp: 20, weapon: Sword(), heal: false)
    }
}
