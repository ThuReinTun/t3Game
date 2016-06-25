//
//  ViewController.swift
//  t3Game
//
//  Created by ThuRein Tun on 6/12/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import UIKit
import Foundation

class t3GamePlayViewController: UIViewController {
    var tiles = [UIButton]()
    
    @IBOutlet weak var lblPlayer1: UILabel!
    @IBOutlet weak var lblPlayer2: UILabel!
    @IBOutlet weak var lblGameStatus: UILabel!
    @IBOutlet weak var btnTile0: UIButton!
    @IBOutlet weak var btnTile1: UIButton!
    @IBOutlet weak var btnTile2: UIButton!
    @IBOutlet weak var btnTile3: UIButton!
    @IBOutlet weak var btnTile4: UIButton!
    @IBOutlet weak var btnTile5: UIButton!
    @IBOutlet weak var btnTile6: UIButton!
    @IBOutlet weak var btnTile7: UIButton!
    @IBOutlet weak var btnTile8: UIButton!
    
    @IBOutlet weak var lblTest: UILabel!
    
    @IBAction func btnTest (sender: UIButton) {
        gamePlay.gameRefresh()
        sortTiles()
    }
    @IBAction func btnTile_TouchDown (sender: UIButton) {
        let tileNo = tiles.indexOf(sender) // tileNo is for indicating empty array index
            showTurnInHeaderVC()
        if (gamePlay.winner == nil) { /* Game is not over yet. */
            if (gamePlay.setPinMarkandPlayerTurn(tileNo!)) /* Condition indicates empty arry index. It shows if a player can set pin at the point or not. */ {
                for i in 0...8 {
                    tiles[i].setBackgroundImage(gamePlay.refreshSetPinImage(gamePlay.graph[i]), forState: .Normal)
                }
//                if (gamePlay.turnP1) {
//                    sender.setImage(gamePlay.setPinImage(gamePlay.turnP1), forState: .Normal)
//                    sender.backgroundColor = UIColor.redColor()
//                    sender.titleLabel?.text = "x"
//                }
//                else {
//                    sender.setImage(gamePlay.setPinImage(gamePlay.turnP1), forState: .Normal)
//                    sender.backgroundColor = UIColor.blueColor()
//                    sender.titleLabel?.text = "o"
//                }
                
                gamePlay.checkGameStatus() /* only to check game status*/
                if (gamePlay.winner != nil) { // Winner is displayed
                    lblGameStatus.text = "\(gamePlay.winner!.name) win"
                }
                else {
                    if (gamePlay.turnP1) { // Player turns are displayed
                        lblGameStatus.text = "\(gamePlay.p1.name)'s turn"
                    }
                    else {
                        lblGameStatus.text = "\(gamePlay.p2.name)'s turn"
                    }
                }
            }
            else {
//                sender.backgroundColor = UIColor.greenColor() /* tile is not empty condition */
            }
        }
    }
    
    @IBAction func gameSettings_TouchUpInside (sender: UIBarButtonItem) {
        gamePlay.gameRefresh()
        sortTiles()
    }
    
    func sortTiles () -> Void {
        tiles = [btnTile0, btnTile1, btnTile2, btnTile3, btnTile4, btnTile5, btnTile6, btnTile7, btnTile8]
        for i in 0...8 {
            tiles[i].setBackgroundImage(gamePlay.refreshSetPinImage(gamePlay.graph[i]), forState: .Normal)
        }
    }
    func showTurnInHeaderVC () -> Void {
//        let header = self.storyboard?.instantiateViewControllerWithIdentifier("HeaderVC") as! HeaderViewController
//        let btnPlayerTurn = s
//        header.btnPlayerTurn.setBackgroundImage(gamePlay.showPlayerTurn(gamePlay.turnP1), forState: .Normal)
    }
//    @IBAction func btnTest_TouchDown (sender: UIButton) {
//        if (gamePlay.turnP1) {
//            sender.titleLabel!.text = "1"
//        }
//        else {
//            sender.titleLabel!.text = "2"
//        }
//        gamePlay.setPinMarkandPlayerTurn(Int(txtTest.text!)!) //incomplete // just testing
//        
//        gamePlay.checkGameStatus()
//    }
    
    @IBAction func segueT3GamePlayVC (segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /* setting game playground */
        tiles = [btnTile0, btnTile1, btnTile2, btnTile3, btnTile4, btnTile5, btnTile6, btnTile7, btnTile8]
        for i in 0...8 {
            tiles[i].setBackgroundImage(gamePlay.refreshSetPinImage(gamePlay.graph[i]), forState: .Normal)
        }
        /* lbl tests */
        lblPlayer1.text = gamePlay.p1.name
        lblPlayer2.text = gamePlay.p2.name
        if (gamePlay.turnP1) {
            lblGameStatus.text = "\(gamePlay.p1.name)'s turn"
        }
        else {
            lblGameStatus.text = "\(gamePlay.p2.name)'s turn"
        }
//        showTurnInHeaderVC()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}