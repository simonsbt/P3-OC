//
//  Personnage.swift
//  Game
//
//  Created by Simon Sabatier on 21/03/2022.
//

import Foundation


/* This class respresents a character with his name and his type */
class Character {
    var name: String
    var characterType: CharacterType
    
    init(name: String, characterType: CharacterType) {
        self.name = name
        self.characterType = characterType
    }
    
    
    /* Used to attack an enemy */
    func attackEnemy(enemyCharacter: Character) { //We have the enemy character to attack in parameter
        enemyCharacter.characterType.hp -= characterType.dmg //Enemy hp = enemy character hp - ally damage
        if enemyCharacter.characterType.hp > 0 { //If the enemy character has more than 0hp, he's alive
            print("(-\(characterType.dmg)hp). Il reste maintenant \(enemyCharacter.characterType.hp) hp à \(enemyCharacter.name)") //Print his actual hp
        }
        else { //Else if it's less than 0hp
            print("(-\(characterType.dmg)hp).") //We print the damage that he received during this turn
            enemyCharacter.characterType.hp = 0 //Set his hp to 0 so their is no negativ numbers
            print("\(enemyCharacter.name) est mort")
        }
    }
    
    
    /* Assign the type caracteristics to the character */
    func assignCharacterType(characterType: String){
        switch(characterType) {
        case "Warrior": self.characterType = CharacterType(typeName: "Warrior", hp: 30, dmg: 25, heal: false) //If we get a type "Warrior" from the console, we assign these caracteristics
        case "Magus": self.characterType = CharacterType(typeName: "Magus", hp: 30, dmg: 10, heal: true)
        case "Colossus": self.characterType = CharacterType(typeName: "Colossus", hp: 30, dmg: 10, heal: false)
            default: break
        }
    }
    
    
    /* Used to heal the character */
    func getHealed(healingAlly: Character) { //We have the healing ally in paramater
        characterType.hp += healingAlly.characterType.dmg //We add the heal to the character that has been healed
        print("\(name) a maintenant \(characterType.hp) points de vie") //We print his new hp
    }
}

var characterNames: [String] = [] //Array that is used to store the names and verify the unicity



