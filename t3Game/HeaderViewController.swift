//
//  HeaderViewController.swift
//  t3Game
//
//  Created by ThuRein Tun on 6/17/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {
    @IBOutlet weak var btnDropDownMenu: UIButton!
    @IBOutlet weak var btnPlayerTurn: UIButton!
    
    @IBAction func btnMenu_TouchDown (sender: UIButton) {
        gamePlay.gameRefresh()
        let t3GamePlay = self.storyboard?.instantiateViewControllerWithIdentifier("t3GamePlayVC") as! t3GamePlayViewController
        t3GamePlay.sortTiles()
//        t3GamePlay.viewDidLoad()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
