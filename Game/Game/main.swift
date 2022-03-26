//
//  main.swift
//  Game
//
//  Created by Simon Sabatier on 21/03/2022.
//

import Foundation

let game = Game() //Creation of a Game that create 2 default players
let player1 = game.p1 //Put the first player into the constant player1
let player2 = game.p2 //Put the second player into the constant player2

/* Here we create the team of the 2 players */
player1.teamCreation()
print("\nCréation de la deuxième équipe :")
player2.teamCreation()


print("\n\nVoici un récapitulatif des équipes : ")
player1.printPlayerTeam() //Print a description of the first team
player2.printPlayerTeam() //Print a description of the second team
print("")

print("\nDébut du jeu.")
game.fight() //Start the fight between the two players


game.isWinner() //Print the winner of the game
game.printStats() //Print the stats of the game

player1.printPlayerTeamDetails()
player2.printPlayerTeamDetails()


/* Function to create the team of a player */




/* Function to print the player's team */





