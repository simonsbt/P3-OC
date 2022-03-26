//
//  Joueur.swift
//  Game
//
//  Created by Simon Sabatier on 21/03/2022.
//

import Foundation


/* This class represents a player with his pseudo and his 3 characters */
class Player {
    var pseudo: String
    var c1 = Character(name: "", characterType: CharacterType())
    var c2 = Character(name: "", characterType: CharacterType())
    var c3 = Character(name: "", characterType: CharacterType())
    
    init(pseudo: String, c1: Character, c2: Character, c3: Character) {
        self.pseudo = pseudo
        self.c1 = c1
        self.c2 = c2
        self.c3 = c3
    }
    
    
    /* Start the turn of the attacking player. The parameters is the enemy player  */
    func myTurn(enemy: Player) {
        if (isAlive()) { //If the player's team is dead, the turn is skipped to end the game
            chooseAllyToAttack(enemyPlayer: enemy)
        }
    }
    
    
    /* Check if all the characters of a player are dead */
    func isAlive() -> (Bool) {
        
        if ((c1.characterType.hp + c2.characterType.hp + c3.characterType.hp) > 0) { //Add the health point of all the player's character
            return true
        }
        return false
        
    }
    
    
    /* Return a String which contains the name of the living characters of a player */
    func aliveCharacters() -> (String) {
        
        var liste: String = ""
        
        if c1.characterType.hp > 0 { //If the character have more than 0 hp
            liste = c1.name + " " //Add his name to the String
        }
        if c2.characterType.hp > 0 {
            liste += c2.name + " "
        }
        if c3.characterType.hp > 0 {
            liste += c3.name
        }
        return liste //Return the String
        
    }
    
    
    /* Used to choose which ally character we want to heal */
    func chooseAllyToHeal(healingAlly: Character) { //We have the healing ally in parameter
        
        var validChoice = false //Used to verify if the ally choosen is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an ally
            
            print("\(pseudo) choisissez le personnage à soigner : \(aliveCharacters())") //Print the list of alives character of the team
            if let healingAllyName  = readLine() {
                switch (healingAllyName) { //Used to apply the heal to the right character
                    
                case c1.name:
                    if (c1.characterType.hp > 0) { //If the charater is alive
                        c1.getHealed(healingAlly: healingAlly) //We apply the heal
                        validChoice = true //We confirm that the choice is valid
                    }
                    else {
                        print("Impossible, ce personnage est mort") //Else if he's dead, we print it and we restart the loop
                    }
                    
                case c2.name:
                    if (c2.characterType.hp > 0) {
                        c2.getHealed(healingAlly: healingAlly)
                        validChoice = true
                    }
                    else {
                        print("Impossible, ce personnage est mort")
                    }
                    
                case c3.name:
                    if (c3.characterType.hp > 0) {
                        c3.getHealed(healingAlly: healingAlly)
                        validChoice = true
                    }
                    else {
                        print("Impossible, ce personnage est mort")
                    }
                    
                default: print("Personnage inexistant")
                }
            }
        }
    }
    
    
    /* Used to choose which ally character will attack the enemy */
    func chooseAllyToAttack(enemyPlayer: Player) { //The enemy player is in parameter
        
        var validChoice = false //Used to check if the ally choosen is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an ally
            
            print("\(pseudo) choisissez votre personnage : \(aliveCharacters())") //Print the list of alives character of the team
            if let attackingAllyName  = readLine() {
                switch (attackingAllyName) {
                    
                    case c1.name:
                        if (c1.characterType.hp > 0) { //If the character is alive
                            if (c1.characterType.heal) { //If the character is used to heal an ally
                                chooseAllyToHeal(healingAlly: c1) //We choose which ally he will heal
                            }
                            else {
                                chooseEnemyToAttack(enemyPlayer: enemyPlayer, attackingAlly: c1) //Else if it's not a healer, we choose which enemy character to attack
                            }
                            validChoice = true //We confirm that the choice is valid
                        }
                        else {
                            print("Impossible, ce personnage est mort") //Else if the character is not alive, we print it and we restart the loop
                        }
                        
                    case c2.name:
                        if (c2.characterType.hp > 0) {
                            if (c2.characterType.heal) {
                                chooseAllyToHeal(healingAlly: c2)
                            }
                            else {
                                chooseEnemyToAttack(enemyPlayer: enemyPlayer, attackingAlly: c2)
                            }
                            validChoice = true
                        }
                        else {
                            print("Impossible, ce personnage est mort")
                        }
                        
                    case c3.name:
                        if (c3.characterType.hp > 0) {
                            
                            if (c3.characterType.heal) {
                                chooseAllyToHeal(healingAlly: c3)
                            }
                            else {
                                chooseEnemyToAttack(enemyPlayer: enemyPlayer, attackingAlly: c3)
                            }
                            validChoice = true
                        }
                        else {
                            print("Impossible, ce personnage est mort")
                        }
                        
                    default: print("Personnage inexistant")
                }
            }
        }
    }
    
    
    /* Used to choose which enemy will be attacked by the attacking ally */
    func chooseEnemyToAttack(enemyPlayer: Player, attackingAlly: Character) { //The enemy player and the attacking ally are in parameters
        
        var validChoice = false //Used to confirm if the choice is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an enemy
            
            print("Quel ennemi voulez-vous attaquer : \(enemyPlayer.aliveCharacters())") //Print the list of alives character of the enemy team
            if let enemyCharacterName  = readLine() {
                switch (enemyCharacterName) {
                    
                    case enemyPlayer.c1.name:
                        if enemyPlayer.c1.characterType.hp > 0 { //If the enemy character is alive
                            attackingAlly.attackEnemy(enemyCharacter: enemyPlayer.c1) //We attack the character
                            validChoice = true //We confirm that the choice is valid
                        }
                        else {
                            print("Impossible, ce personnage est déjà mort") //Else if he's dead, we print it and restart the loop
                        }
                        
                    case enemyPlayer.c2.name:
                        if enemyPlayer.c2.characterType.hp > 0 {
                            attackingAlly.attackEnemy(enemyCharacter: enemyPlayer.c2)
                            validChoice = true
                        }
                        else {
                            print("Impossible, ce personnage est déjà mort")
                        }
                        
                    case enemyPlayer.c3.name:
                        if enemyPlayer.c3.characterType.hp > 0 {
                            attackingAlly.attackEnemy(enemyCharacter: enemyPlayer.c3)
                            validChoice = true
                        }
                        else {
                            print("Impossible, ce personnage est déjà mort")
                        }
                        
                    default: print("Personnage inexistant")
                }
            }
        }
    }
    
    func teamCreation() {
        
        var validType: Bool //Bool to check if the type of a character exist
        var validName: Bool //Bool to check if the name of a character doesn't exist already
        
        print("Choisissez le nom du joueur")
        if let playerName  = readLine() { //Read the player name from the console
            pseudo = playerName
        }
        for i in 1...3 { //For loop to create the 3 characters of a player's team
            validType = false
            validName = false
            
            while (!validName) { //While the name is not valid, the character's name is asked
                
                print("\nChoisissez le nom du personnage \(i) de \(pseudo)")
                
                if let characterName  = readLine() {
                    if !characterNames.contains(characterName) { //Check if the name entered in the console doesn't already exist in the array of character's names
                        characterNames.append(characterName) //If it doesn't exist, we add it in the array
                        
                        switch (i) {
                            case 1: c1.name = characterName //change the character name by the name entered in the console
                            case 2: c2.name = characterName //for each character
                            case 3: c3.name = characterName //for each character
                            default: break
                        }
                        
                        validName = true //Validate that the name is correct
                    }
                    else {
                        print("\nCe nom est déjà pris") //Else if the name already exist, we print it and we restart the loop
                    }
                }
            }
            
            while(!validType) { //While the type is not valid, the character's type is asked
                
                print("\nChoisissez le type du personnage \(i) de \(pseudo) parmis cette liste : \(characterTypes)")
                
                if let characterType  = readLine() {
                    if characterTypes.contains(characterType) { //Check if the type entered in the console  exist in the array of character's types
                        
                        switch (i) {
                            case 1: c1.assignCharacterType(characterType: characterType) //characterType = CharacterType(typeName: "Warrior", hp: 30, dmg: 30, heal: false) //assign the character type
                            case 2: c2.assignCharacterType(characterType: characterType) //characterType = CharacterType(typeName: "Magus", hp: 30, dmg: 10, heal: true) //for each character
                            case 3: c3.assignCharacterType(characterType: characterType) //characterType = CharacterType(typeName: "Colossus", hp: 30, dmg: 10, heal: false) //for each character
                            default: break
                        }
                        
                        validType = true //Validate that the type is correct
                    }
                    else {
                        print("\nType de personnage inexistant") //Else if the type doesn't exist, we print it and we restart the loop
                    }
                }
            }
        }
    }
    
    func printPlayerTeam() {
        print("\nEquipe de \(pseudo) :")
        print("Personnage 1 : \(c1.name), de type \(c1.characterType.typeName)")
        print("Personnage 2 : \(c2.name), de type \(c2.characterType.typeName)")
        print("Personnage 3 : \(c3.name), de type \(c3.characterType.typeName)")
    }

    func printPlayerTeamDetails() {
        print("\nEquipe de \(pseudo) :")
        print("Personnage 1 : \(c1.name), de type \(c1.characterType.typeName) ayant \(c1.characterType.hp) pdv et \(c1.characterType.dmg) dmg")
        print("Personnage 2 : \(c2.name), de type \(c2.characterType.typeName) ayant \(c2.characterType.hp) pdv et \(c2.characterType.dmg) dmg")
        print("Personnage 3 : \(c3.name), de type \(c3.characterType.typeName) ayant \(c3.characterType.hp) pdv et \(c3.characterType.dmg) dmg")
    }

}
