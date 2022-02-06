//
//  Player.swift
//  Test
//
//  Created by Alexander Malygin on 06.02.2022.
//

import Foundation

class Player
{
    
    
    var Cards:Array<Card> = []
    var Wins:Int = 0
    var RoundPower:Int = 0
    var RoundCards: Array<Card> = []
    var IsPassed:Bool
    
    init() {
        for _ in 0...1{
            self.Cards.append(Card(attack: 6))
        }
        
        for _ in 0...2{
            self.Cards.append(Card(attack: 4))
        }
        
        for _ in 0...4{
            self.Cards.append(Card(attack: 2))
        }
        
        for _ in 0...9{
            self.Cards.append(Card(attack: 1))
        }
        
        self.IsPassed = false
        self.Cards.shuffle()
        
        for _ in 0...4{
            self.RoundCards.append(self.Cards.popLast()!)
        }
    }
}
