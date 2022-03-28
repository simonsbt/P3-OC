//
//  Game.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation

class Game {
    
    var players: [Player]
    var nbTurns = 0
    
    init() {
        self.players = [Player(), Player()]
    }
    
    
    /* Print the pseudo of the winner of the game */
    func isWinner() {
        print("La partie est finie !")
        if (players[0].teamIsAlive()) {
            print("L'équipe de \(players[0].pseudo) à gagné la partie !")
        }
        else {
            print("L'équipe de \(players[1].pseudo) à gagné la partie !")
        }
    }
    
    
    /* Used during the fight */
    func fight() {
        var attackingPlayer: Player //This variable will define which player will attack
        var enemyPlayer: Player //And which player will be attacked
        
        while(players[0].teamIsAlive() && players[1].teamIsAlive()) { //While both teams are alive
            nbTurns += 1 //We add a turn
            
            if ((self.nbTurns%2) == 0) { //Alternate the attacking player and the attacked player
                attackingPlayer = players[1]
                enemyPlayer = players[0]
            }
            else {
                attackingPlayer = players[0]
                enemyPlayer = players[1]
            }
            
            attackingPlayer.myTurn(enemy: enemyPlayer) //Start the turn of the attacking player
        }
    }
    
    /* Print the global statistics of the game */
    func printStats() {
        for player in players {
            print("\nEquipe de \(player.pseudo) :")
            for i in 0...player.team.count - 1 {
                print("Personnage \(i+1) : \(player.team[i].name), avec \(player.team[i].hp) pdv.") //Print each character of the 2 teams with their name and their health points
            }
        }
    }
    
}
