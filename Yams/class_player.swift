//
//  class_player.swift
//  Yams
//
//  Created by Supinfo on 29/02/16.
//  Copyright © 2016 Ynov. All rights reserved.
//

import Foundation

class Player {
    var name : String = String();
    var tabDice : [Dice] = [Dice]();
    var scoreGrid: ScoreGrid = ScoreGrid();
    
    var finished: Bool = false;
    
    init(_ name_init : String) {
        name = name_init;
    }
    
    func diceValuesToString() -> String {
        var values : String = String();
        for i in 0...4 {
            values += "\(tabDice[i].value)";
            if(i < 4) {
                values += ", ";
            }
        }
        
        return values;
    }
    
    func orderDiceTab()
    {
        tabDice.sortInPlace { (dice1, dice2) -> Bool in
            return dice1.value < dice2.value
        }
    }
    
    func Play()
    {
        tabDice = [Dice(), Dice(), Dice(), Dice(), Dice()];
        self.orderDiceTab();
        
        roundsLoop: for round in 1...3
        {
            if(round == 1)
            {
                print("Voulez-vous relancer des dés ? (O: oui / N: non)" +
                    "\nPour rappel, leurs valeurs sont : \(diceValuesToString())"
                );
                if (readLine() == "O")
                {
                    diceRolls: for _ in 0...4
                    {
                        print("Choisissez un dé à relancer (1 à 5, null pour passer) : ");
                        let diceIndex = readLine()!;
                        
                        if(!diceIndex.isEmpty)
                        {
                            tabDice[Int(diceIndex)! - 1] = Dice();
                            print("Votre dé a été relancé !");
                        }
                        else
                        {
                            break diceRolls;
                        }
                    }
                }
                
                self.orderDiceTab();
                
                print("Voulez-vous enregistrer le score de vos dés ? (O: oui / N: non)" +
                    "\nPour rappel, leurs valeurs sont : \(diceValuesToString())"
                );
                
                let input = readLine();
                
                if (input == "O")
                {
                    print("Choisissez dans la liste suivante, le score que vous voulez sauvegarder :");
                    for i in 0...12
                    {
                        print("\(i+1)/ \(scoreGrid.gridCellsName[i])");
                    }
                    
                    var selectedCell: Int = Int(readLine()!)!;
                    var valueToAdd: Int = 0;
                    
                    switch selectedCell
                    {
                    case 1:
                        // Somme des 1
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 1)
                            {
                                valueToAdd += 1;
                            }
                        }
                    case 2:
                        // Somme des 2
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 2)
                            {
                                valueToAdd += 2;
                            }
                        }
                    case 3:
                        // Somme des 3
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 3)
                            {
                                valueToAdd += 3;
                            }
                        }
                    case 4:
                        // Somme des 4
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 4)
                            {
                                valueToAdd += 4;
                            }
                        }
                    case 5:
                        // Somme des 5
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 5)
                            {
                                valueToAdd += 5;
                            }
                        }
                    case 6:
                        // Somme des 6
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 6)
                            {
                                valueToAdd += 6;
                            }
                        }
                    case 7:
                        // Brelan
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 8:
                        // Full
                        valueToAdd = 30;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 9:
                        // Carré
                        valueToAdd = 40;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 10:
                        // Petite Suite
                        valueToAdd = 45;
                        if(tabDice[0].value == 1) {
                            if(tabDice[1].value == 2) {
                                if(tabDice[2].value == 3) {
                                    if(tabDice[3].value == 4) {
                                        if(tabDice[4].value == 5)
                                        {
                                            valueToAdd += 15;
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            print("Ce n'est pas une petite suite !")
                            valueToAdd = 0;
                        }
                    case 11:
                        // Grande Suite
                        valueToAdd = 50;
                        if(tabDice[0].value == 2) {
                            if(tabDice[1].value == 3) {
                                if(tabDice[2].value == 4) {
                                    if(tabDice[3].value == 5) {
                                        if(tabDice[4].value == 6)
                                        {
                                            valueToAdd += 20;
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            print("Ce n'est pas une grande suite !")
                            valueToAdd = 0;
                        }
                    case 12:
                        // Yams
                        valueToAdd = 50;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 13:
                        // Chance
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    default:
                        break;
                    }
                    
                    // Décrément de 1 pour correspondre aux bons index
                    selectedCell = selectedCell - 1;
                    
                    scoreGrid.addValue(selectedCell, value: valueToAdd);
                    
                    if(valueToAdd > 0 && scoreGrid.gridCells[selectedCell] == valueToAdd)
                    {
                        print("La valeur a bien été ajoutée au tableau des scores !");
                        print("Voici votre tableau de score :");
                        
                        scoreGrid.dispScoreGrid();
                        
                        break roundsLoop;
                    }
                }
            }
            else if(round == 2)
            {
                print("Vos dés sont relancés");
                
                for diceIndex in 0...4 {
                    tabDice[diceIndex] = Dice();
                }
                
                self.orderDiceTab();
                
                print("Voulez-vous relancer des dés ? (O: oui / N: non)" +
                    "\nLeurs valeurs sont : \(diceValuesToString())"
                );
                
                if (readLine() == "O")
                {
                    diceRolls: for _ in 0...4
                    {
                        print("Choisissez un dé à relancer (1 à 5, null pour passer) : ");
                        let diceIndex = readLine()!;
                        
                        if(!diceIndex.isEmpty)
                        {
                            tabDice[Int(diceIndex)! - 1] = Dice();
                            print("Votre dé a été relancé !");
                        }
                        else
                        {
                            self.orderDiceTab();
                            break diceRolls;
                        }
                    }
                }
                
                self.orderDiceTab();
                
                print("Voulez-vous enregistrer le score de vos dés ? (O: oui / N: non)" +
                    "\nPour rappel, leurs valeurs sont : \(diceValuesToString())"
                );
                
                let input = readLine();
                
                if (input == "O")
                {
                    print("Choisissez dans la liste suivante, le score que vous voulez sauvegarder :");
                    for i in 0...12
                    {
                        print("\(i+1)/ \(scoreGrid.gridCellsName[i])");
                    }
                    
                    var selectedCell: Int = Int(readLine()!)!;
                    var valueToAdd: Int = 0;
                    
                    switch selectedCell
                    {
                    case 1:
                        // Somme des 1
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 1)
                            {
                                valueToAdd += 1;
                            }
                        }
                    case 2:
                        // Somme des 2
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 2)
                            {
                                valueToAdd += 2;
                            }
                        }
                    case 3:
                        // Somme des 3
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 3)
                            {
                                valueToAdd += 3;
                            }
                        }
                    case 4:
                        // Somme des 4
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 4)
                            {
                                valueToAdd += 4;
                            }
                        }
                    case 5:
                        // Somme des 5
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 5)
                            {
                                valueToAdd += 5;
                            }
                        }
                    case 6:
                        // Somme des 6
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            if(dice.value == 6)
                            {
                                valueToAdd += 6;
                            }
                        }
                    case 7:
                        // Brelan
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 8:
                        // Full
                        valueToAdd = 30;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 9:
                        // Carré
                        valueToAdd = 40;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 10:
                        // Petite Suite
                        valueToAdd = 45;
                    case 11:
                        // Grande Suite
                        valueToAdd = 50;
                    case 12:
                        // Yams
                        valueToAdd = 50;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    case 13:
                        // Chance
                        valueToAdd = 0;
                        for dice in tabDice
                        {
                            valueToAdd += dice.value;
                        }
                    default:
                        break;
                    }
                    print(valueToAdd);
                    
                    // Décrément de 1 pour correspondre aux bons index
                    selectedCell = selectedCell - 1;
                    
                    scoreGrid.addValue(selectedCell, value: valueToAdd);
                    
                    if(scoreGrid.gridCells[selectedCell] == valueToAdd)
                    {
                        print("La valeur a bien été ajoutée au tableau des scores !");
                        print("Voici votre tableau de score :");
                        
                        scoreGrid.dispScoreGrid();
                        
                        break roundsLoop;
                    }
                }
            }
            else if(round == 3)
            {
                print("Attention, dernière chance, vous devez choisir le score que vous voulez faire !" +
                    "\nVeuillez choisir parmi la liste suivante : "
                );
                
                for i in 6...11
                {
                    print("\(i)/ \(scoreGrid.gridCellsName[i])");
                }
                
                chooseScoreToSaveLoop: while true
                {
                    let selectedCell: Int = Int(readLine()!)!;
                
                    if(scoreGrid.gridCells[selectedCell] != 0)
                    {
                        print("Vous ne pouvez pas sauvegarder ce score, il a déjà été sauvegardé plus tôt !");
                        print("Veuillez choisir un autre score :");
                    }
                    else
                    {
                        break chooseScoreToSaveLoop;
                    }
                }
            }
        }
    }
}