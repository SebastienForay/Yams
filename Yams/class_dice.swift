//
//  class_dice.swift
//  Yams
//
//  Created by Supinfo on 29/02/16.
//  Copyright © 2016 Ynov. All rights reserved.
//

import Foundation

class Dice {
    var value: Int = Int();
    
    init() {
        self.Mix();
    }
    
    func Mix() {
        // Random de 0 à 5, toutes les valeurs sont incrémentées de 1 pour être entre 1 et 6.
        value = Int(arc4random_uniform(6)) + 1;
    }
}
