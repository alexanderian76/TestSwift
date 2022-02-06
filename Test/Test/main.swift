//
//  main.swift
//  Test
//
//  Created by Alexander Malygin on 06.02.2022.
//

import Foundation



var player = Player()
var CPU = Player()

var rounds = 3

for i in 1...rounds
{
    if(i > 1)
    {
        for _ in 0...2{
            player.RoundCards.append(player.Cards.popLast()!)
            CPU.RoundCards.append(CPU.Cards.popLast()!)
        }
    }
    while(!player.IsPassed || !CPU.IsPassed)
    {
        if(!player.IsPassed)
        {
            if(player.RoundCards.count > 0 && readLine() == "0")
            {
                player.RoundPower += player.RoundCards.popLast()!.Attack
                player.IsPassed = false
            }
            else
            {
                player.IsPassed = true
            }
        }
        if(CPU.RoundCards.count > 0 && !CPU.IsPassed)
        {
            CPU.IsPassed = Bool.random()
            if(!CPU.IsPassed)
            {
                CPU.RoundPower += CPU.RoundCards.popLast()!.Attack
            }
        }
    }
    
    if(player.RoundPower > CPU.RoundPower)
    {
        player.Wins+=1
        print("Round \(i)")
        print("\(player.RoundPower), \(CPU.RoundPower)")
        print("Player won this round")
    }
    else if(player.RoundPower == CPU.RoundPower)
    {
        print("Round \(i)")
        print("\(player.RoundPower), \(CPU.RoundPower)")
        print("Deuce")
    }
    else
    {
        CPU.Wins+=1
        print("Round \(i)")
        print("\(player.RoundPower), \(CPU.RoundPower)")
        print("CPU won this round")
    }
    if(player.Wins > 1 || CPU.Wins > 1) {
        break
    }
    player.RoundPower = 0
    CPU.RoundPower = 0
    player.IsPassed = false
    CPU.IsPassed = false
}

if(player.Wins > CPU.Wins) {
    print("Player won the game!")
}
else if(player.Wins == CPU.Wins)
{
    print("Duece")
}
else {
    print("CPU won the game!")
}


