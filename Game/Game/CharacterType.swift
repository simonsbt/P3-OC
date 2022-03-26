//
//  TypePerso.swift
//  Game
//
//  Created by Simon Sabatier on 21/03/2022.
//

import Foundation


/* This class represents a character type */
class CharacterType {
    var typeName: String = ""
    var hp: Int = 0
    var dmg: Int = 0
    var heal: Bool = false
    
    init() {
        
    }
    
    init(typeName: String, hp: Int, dmg: Int, heal: Bool) {
        self.typeName = typeName
        self.hp = hp
        self.dmg = dmg
        self.heal = heal
    }
    
    
}

let characterTypes = ["Warrior", "Magus", "Colossus"] //Array that is used to verify if a type of charcater is valid

/*
 Caracteristics of the differents types :s
 
 Warrior : 60pdv, 25dmg
 Magus : 80pdv, heal 10
 Colossus : 100pdv, 10dmg
 
*/
