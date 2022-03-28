//
//  Character.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation


/* This class respresents a character with his name and his type */
class Character {
    
    var name: String
    var hp: Int
    var weapon: Weapon
    var heal: Bool
    
    init(name: String, hp: Int, weapon: Weapon, heal: Bool) {
        self.name = name
        self.hp = hp
        self.weapon = weapon
        self.heal = heal
    }
    
    /* Used to heal the character */
    func getHealed(healingAlly: Character) { //We have the healing ally in paramater
        hp += healingAlly.weapon.dmg //We add the heal to the character that has been healed
        print("")
        print("\(name) a maintenant \(hp) points de vie") //We print his new hp
        print("")
    }
    
    /* Used to attack an enemy */
    func attackEnemy(enemyCharacter: Character) { //We have the enemy character to attack in parameter
        enemyCharacter.hp -= weapon.dmg //Enemy hp = enemy character hp - ally damage
        isAlive(enemyCharacter: enemyCharacter)
    }
    
    func isAlive(enemyCharacter: Character) {
        if enemyCharacter.hp > 0 { //If the enemy character has more than 0hp, he's alive
            print("")
            print("(-\(weapon.dmg)hp). Il reste maintenant \(enemyCharacter.hp) hp à \(enemyCharacter.name)") //Print his actual hp
            print("")
        }
        else { //Else if it's less than 0hp
            print("")
            print("(-\(weapon.dmg)hp).") //We print the damage that he received during this turn
            enemyCharacter.hp = 0 //Set his hp to 0 so their is no negativ numbers
            print("\(enemyCharacter.name) est mort")
            print("")
        }
    }
    
}

let typesNames = ["Warrior", "Magus", "Colossus"]
var characterNames: [String] = []
