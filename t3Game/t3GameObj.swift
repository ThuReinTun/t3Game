//
//  t3GameObj.swift
//  t3Game
//
//  Created by ThuRein Tun on 6/12/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import UIKit

class t3GameObj {
    let p1: t3GamePlayer
    let p2: t3GamePlayer
    let emptyPlayer: t3GamePlayer = t3GamePlayer(name: "Draw", pin: 0)
    var winner: t3GamePlayer?
    var graph = [Int](count: 9, repeatedValue: 0)
    var turnP1: Bool = true
    
    init (P1: t3GamePlayer, P2: t3GamePlayer) {
        self.p1 = P1
        self.p2 = P2
    }
    
    func gameRefresh () -> Void {
        winner = nil
        for i in 0...8 {
            graph[i] = 0
        }
        turnP1 = true
    }
    func gameEnd () -> Void {
        
    }
    func showPlayerTurn (p1Turn: Bool) -> UIImage? {
        let imageName: String
        if (p1Turn) {
            imageName = "CircleFill"
        }
        else {
            imageName = "SquareFill"
        }
        return UIImage(named: imageName)
    }
    func refreshSetPinImage (pin: Int) -> UIImage? { /* to set player pin image */
        let imageName: String
        if (pin == 0) {
            if (turnP1) {
                imageName = "CircleEmpty"
            }
            else {
                imageName = "SquareEmpty"
            }
        }
        else if (pin == 1) {
            imageName = "CircleFill"
        }
        else if (pin == 2) {
            imageName = "SquareFill"
        }
        else {
            imageName = ""  // set empty just to solve constant use of imagename before being initialized
        }
        return UIImage(named: imageName)
    }
//    func setPinImage (turn: Bool) -> UIImage? {
//        let imageName: String
//        if (turn) {
//            imageName = "CircleFill"
//        }
//        else {
//            imageName = "SquareFill"
//        }
//        return UIImage(named: imageName)
//    }
    func setPinMarkandPlayerTurn (PinMark: Int) -> Bool { /* set PinMark in graph array and Player Turns */
        if (graph[PinMark] == 0) { /* check graph[PinMark] is empty (contain zero) */
            if (turnP1) {
                graph[PinMark] = 1
                turnP1 = false
            }
            else {
                graph[PinMark] = 2
                turnP1 = true
            }
            return true //Pin Mark is set
        }
        return false //Pin Mark failed to set
    }
    func checkGameStatus () -> Void {
        if (graph[0]==1 && graph[1]==1 && graph[2]==1) /* Player 1 win conditions */
        || (graph[3]==1 && graph[4]==1 && graph[5]==1)
        || (graph[6]==1 && graph[7]==1 && graph[8]==1)
            
        || (graph[0]==1 && graph[3]==1 && graph[6]==1)
        || (graph[1]==1 && graph[4]==1 && graph[7]==1)
        || (graph[2]==1 && graph[5]==1 && graph[8]==1)
        
        || (graph[0]==1 && graph[4]==1 && graph[8]==1)
        || (graph[2]==1 && graph[4]==1 && graph[6]==1) {
            winner = p1
        }
        else if (graph[0]==2 && graph[1]==2 && graph[2]==2) /* Player 2 win conditions */
            || (graph[3]==2 && graph[4]==2 && graph[5]==2)
            || (graph[6]==2 && graph[7]==2 && graph[8]==2)
            
            || (graph[0]==2 && graph[3]==2 && graph[6]==2)
            || (graph[1]==2 && graph[4]==2 && graph[7]==2)
            || (graph[2]==2 && graph[5]==2 && graph[8]==2)
            
            || (graph[0]==2 && graph[4]==2 && graph[8]==2)
            || (graph[2]==2 && graph[4]==2 && graph[6]==2) {
            winner = p2
        }
        else { /* Draw condition */
            if (!graph.contains(0)) {
                winner = emptyPlayer
            }
        }
    }
}