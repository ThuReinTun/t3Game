//
//  t3GamePlayer.swift
//  t3Game
//
//  Created by ThuRein Tun on 6/12/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//
import Foundation
//import UIKit

class t3GamePlayer {
    let name: String
    let pin: Int
    let points: Int = 0
    
    init (name: String, pin: Int) {
        self.name = name
        self.pin = pin
    }
}