//
//  class_scoregrid.swift
//  Yams
//
//  Created by Supinfo on 29/02/16.
//  Copyright © 2016 Ynov. All rights reserved.
//

import Foundation

class ScoreGrid {
    var gridCellsName : [String] = ["Un", "Deux", "Trois", "Quatre", "Cinq", "Six", "Brelan", "Full", "Carré", "Petite Suite", "Grande Suite", "Yams", "Chance"];
    var gridCells : [Int] = [Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int(), Int()];
    var emptyCells: Int = 13;
    
    init() {
        for i in 0...12 {
            gridCells[i] = 0;
        }
    }
    
    func addValue(cell: Int, value: Int) {
        gridCells[cell] = value;
        emptyCells -= 1;
    }
    
    func dispScoreGrid()
    {
        for i in 0...12 {
            print("\(gridCellsName[i]) -> \(gridCells[i])");
        }
    }
    
    func getTotal() -> Int
    {
        var totalNumbers: Int = 0;
        var totalAndPrime: Int = 0;
        var totalPartiel: Int = 0;
        var totalFinal: Int = 0;
        
        for i in 0...5
        {
            totalNumbers += gridCells[i];
        }
        for i in 6...12
        {
            totalPartiel += gridCells[i];
        }
        
        if(totalNumbers > 63)
        {
            totalAndPrime = totalNumbers + 30;
        }
        
        totalFinal = totalAndPrime + totalFinal;
        
        return totalFinal;
    }
}