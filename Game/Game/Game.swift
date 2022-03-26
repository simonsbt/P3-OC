//
//  Jeu.swift
//  Game
//
//  Created by Simon Sabatier on 21/03/2022.
//

import Foundation


/* This class respresent a game with 2 players and the number of turns of the game */
class Game {
    var p1 = Player(pseudo: "", c1: Character(name: "", characterType: CharacterType()), c2: Character(name: "", characterType: CharacterType()), c3: Character(name: "", characterType: CharacterType()))
    var p2 = Player(pseudo: "", c1: Character(name: "", characterType: CharacterType()), c2: Character(name: "", characterType: CharacterType()), c3: Character(name: "", characterType: CharacterType()))
    var nbTurns = 0
    
    
    /* Print the global statistics of the game */
    func printStats() {
        print("\nEquipe de \(p1.pseudo) :")
        print("Personnage 1 : \(p1.c1.name), avec \(p1.c1.characterType.hp) pdv.") //Print each character of the 2 teams with their name and their health points
        print("Personnage 2 : \(p1.c2.name), avec \(p1.c2.characterType.hp) pdv.")
        print("Personnage 3 : \(p1.c3.name), avec \(p1.c3.characterType.hp) pdv.")
        print("\nEquipe de \(p2.pseudo) :")
        print("Personnage 1 : \(p2.c1.name), avec \(p2.c1.characterType.hp) pdv.")
        print("Personnage 2 : \(p2.c2.name), avec \(p2.c2.characterType.hp) pdv.")
        print("Personnage 3 : \(p2.c3.name), avec \(p2.c3.characterType.hp) pdv.")
        print("\nLa partie à duré \(nbTurns) tours.") //Print the number of turns of the game
    }
    
    
    /* Print the pseudo of the winner of the game */
    func isWinner() {
        print("La partie est finie !")
        if (p1.isAlive()) {
            print("L'équipe de \(p1.pseudo) à gagné la partie !")
        }
        else {
            print("L'équipe de \(p2.pseudo) à gagné la partie !")
        }
    }
    
    
    /* Used during the fight */
    func fight() {
        var attackingPlayer: Player //This variable will define which player will attack
        var enemyPlayer: Player //And which player will be attacked
        
        while(p1.isAlive() && p2.isAlive()) { //While both teams are alive
            nbTurns += 1 //We add a turn
            
            if ((self.nbTurns%2) != 0) { //Alternate the attacking player and the attacked player
                attackingPlayer = p2
                enemyPlayer = p1
            }
            else {
                attackingPlayer = p1
                enemyPlayer = p2
            }
            
            attackingPlayer.myTurn(enemy: enemyPlayer) //Start the turn of the attacking player
        }
    }
}
