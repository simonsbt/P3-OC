//
//  main.swift
//  Game
//
//  Created by Simon Sabatier on 26/03/2022.
//

import Foundation

let game = Game()
let player1 = game.players[0]
let player2 = game.players[1]

/* Here we create the team of the 2 players */
player1.createTeam()
print("\nCréation de la deuxième équipe :")
player2.createTeam()



print("\n\nVoici un récapitulatif des équipes : ")
player1.printTeamDetails() //Print a description of the teams
player2.printTeamDetails()
print(characterNames)
print("")

print("\nDébut du jeu.")
game.fight() //Start the fight between the two players


game.isWinner() //Print the winner of the game
game.printStats() //Print the stats of the game



