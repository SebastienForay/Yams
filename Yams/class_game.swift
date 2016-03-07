//
//  class_game.swift
//  Yams
//
//  Created by Supinfo on 29/02/16.
//  Copyright © 2016 Ynov. All rights reserved.
//

import Foundation

class Game
{
    var player: Player = Player("NoName");
    //var computer: Computer = Computer("Computer");
    
    func InitGame()
    {
        print("Hello, veuillez entrez votre pseudo :");
        player = Player(readLine()!);
        
        /*print("Vous êtes " + player.name + "." +
            //", vous jouez contre " + computer.name + ". Bonne chance!\n" +
            "\nLe jeu mélange vos dés..." +
            "\nLes valeurs de vos dés sont : " + player.diceValuesToString()
        );*/
    }
    
    func Run() {
        gameLoop: while true
        {
            player.Play();
            //computer.Play();
            
            if(player.finished)
            {
                print("Bravo \(player.name), vous avez gagné \(player.scoreGrid.getTotal()) points !");
                break gameLoop;
            }
            /*else if(computer.finished)
            {
                print("Dommage \(player.name), \(computer.name) a gagné la partie.");
                break gameLoop;
            }*/
        }
    }
    
    init() {
        self.InitGame();
    }
}