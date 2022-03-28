//
//  Player.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation

/* This class represents a player with his pseudo and his 3 characters */
class Player {
    
    var pseudo: String
    var team: [Character]
    
    init() {
        self.pseudo = ""
        self.team = [Colossus(name: ""), Colossus(name: ""), Colossus(name: "")]
    }
    
    /* Start the turn of the attacking player. The parameter is the enemy player  */
    func myTurn(enemy: Player) {
        if (teamIsAlive()) { //If the player's team is dead, the turn is skipped to end the game
            chooseAllyToAttack(enemyPlayer: enemy)
        }
    }
    
    func teamIsAlive() -> Bool {
        var totalHp = 0
        for i in 0...team.count - 1 {
            totalHp += team[i].hp
        }
        if totalHp > 0 {
            return true
        }
        else {
            return false
        }
    }
    
    func aliveCharacters() -> (String) {
        
        var list: String = ""
        
        for i in 0...team.count - 1 {
            if team[i].hp > 0 { //If the character have more than 0 hp
                list += team[i].name + " " //Add his name to the String
            }
        }
        return list //Return the String
    }
    
    private func chooseAllyToHeal(healingAlly: Character) { //We have the healing ally in parameter
        
        var validChoice = false //Used to verify if the ally choosen is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an ally
            
            print("\(pseudo) choisissez le personnage à soigner : \(aliveCharacters())") //Print the list of alives character of the team
            if let healingAllyName  = readLine() {
                for i in 0...team.count - 1 {
                    if getTeamCharactersNames().contains(healingAllyName) {
                        if healingAllyName == team[i].name {
                            if team[i].hp > 0 {
                                team[i].getHealed(healingAlly: healingAlly)
                                validChoice = true
                            }
                            else {
                                print("Ce personnage est mort")
                            }
                        }
                    }
                    else {
                        print("Ce personnage n'existe pas dans votre équipe")
                        break
                    }
                }
            }
        }
    }
    
    /* Used to choose which ally character will attack the enemy */
    private func chooseAllyToAttack(enemyPlayer: Player) { //The enemy player is in parameter
        
        var validChoice = false //Used to check if the ally choosen is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an ally
            
            print("\(pseudo) choisissez votre personnage : \(aliveCharacters())") //Print the list of alives character of the team
            if let attackingAllyName  = readLine() {
                
                for i in 0...team.count - 1 {
                    if getTeamCharactersNames().contains(attackingAllyName) {
                        if attackingAllyName == team[i].name {
                            if team[i].hp > 0 {
                                if team[i].heal {
                                    chooseAllyToHeal(healingAlly: team[i])
                                }
                                else {
                                    chooseEnemyToAttack(enemyPlayer: enemyPlayer, attackingAlly: team[i]) //Else if it's not a healer, we choose which enemy character to attack
                                }
                                validChoice = true
                            }
                            else {
                                print("Ce personnage est mort")
                            }
                        }
                    }
                    else {
                        print("Ce personnage n'existe pas dans votre équipe")
                        break
                    }
                }
            }
        }
    }
    
    /* Used to choose which enemy will be attacked by the attacking ally */
    private func chooseEnemyToAttack(enemyPlayer: Player, attackingAlly: Character) { //The enemy player and the attacking ally are in parameters
        
        var validChoice = false //Used to confirm if the choice is valid
        
        while(!validChoice) { //While it's not valid, we ask to choose an enemy
            
            print("Quel ennemi voulez-vous attaquer : \(enemyPlayer.aliveCharacters())") //Print the list of alives character of the enemy team
            if let enemyCharacterName  = readLine() {
                
                for i in 0...enemyPlayer.team.count - 1 {
                    if enemyPlayer.getTeamCharactersNames().contains(enemyCharacterName) {
                        if enemyPlayer.team[i].name == enemyCharacterName {
                            if enemyPlayer.team[i].hp > 0 {
                                attackingAlly.attackEnemy(enemyCharacter: enemyPlayer.team[i]) //We attack the character
                                validChoice = true
                            }
                            else {
                                print("Impossible, ce personnage est déjà mort")
                            }
                        }
                    }
                    else {
                        print("Ce personnage n'existe pas dans l'équipe ennemie")
                        break
                    }
                }
            }
        }
    }
    
    func createTeam() {
        
        print("Choisissez le pseudo du joueur")
        if let playerName  = readLine() { //Read the player name from the console
            pseudo = playerName
        }
        
        for i in 0...team.count - 1 {
            
            var characterName = ""
            var validName = false
            var validType = false
            
            while(!validName) {
                print("Choisissez le nom de votre personnage n°\(i+1)")
                if let name = readLine() {
                    if !characterNames.contains(name) {
                        characterName = name
                        characterNames.append(name)
                        validName = true
                    }
                    else {
                        print("Ce nom est déjà utilisé.")
                    }
                }
            }
            while(!validType) {
                print("Choisissez le type de \(characterName) parmis cette liste : \(typesNames)")
                if let type = readLine() {
                    switch(type) {
                        case "Warrior":
                            team[i] = Warrior(name: characterName)
                            validType = true
                        case "Magus":
                            team[i] = Magus(name: characterName)
                            validType = true
                        case "Colossus":
                            team[i] = Colossus(name: characterName)
                            validType = true
                        default:
                            print("Ce type n'existe pas.")
                    }
                }
            }
        }
    }
    
    func printTeamDetails() {
        print("")
        print("Equipe de \(pseudo)")
        for i in 0...team.count - 1 {
            print("Personnage n°\(i+1) : \(team[i].name) avec \(team[i].hp) hp, qui inflige \(team[i].weapon.dmg) dmg")
        }
    }
    
    func getTeamCharactersNames() -> [String] {
        var teamCharactersNames = [""]
        for i in 0...team.count - 1 {
            teamCharactersNames.append(team[i].name)
        }
        return teamCharactersNames
    }
}
