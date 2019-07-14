//
//  InterfaceController.swift
//  MemorizeThis Extension
//
//  Created by Siddharth Trivedi on 2019-07-13.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    var givenSequence : [Int] = []
    var inputSequence : [Int] = []
    
    enum DIFFICULTY {
        case HARD, EASY
    }
    
    var gameDifficulty = DIFFICULTY.EASY
    
    @IBOutlet weak var lblMemorize: WKInterfaceLabel!
    
    @IBOutlet weak var imgView1: WKInterfaceImage!
    @IBOutlet weak var imgView2: WKInterfaceImage!
    @IBOutlet weak var imgView3: WKInterfaceImage!
    @IBOutlet weak var imgView4: WKInterfaceImage!
    
    @IBOutlet weak var imgResult: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let segueId: String = (context as! String)
        gameDifficulty = segueId == "hardSegue" ? DIFFICULTY.HARD : DIFFICULTY.EASY
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            print("Session is reachable: \(session.isReachable)")
        }
        if gameDifficulty == DIFFICULTY.EASY {
            lblMemorize.setText("Memorize this!")
        }
        else if gameDifficulty == DIFFICULTY.EASY {
            lblMemorize.setText("Memorize in reverse!")
        }
        
        setPattern()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        WKInterfaceDevice().play(.click)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        WKInterfaceDevice().play(.click)
        print("WATCH: Got a message!")
        
        inputSequence = message["data"] as! Array;
        print("Given: ", givenSequence)
        print("Input: ", inputSequence)
        
         self.imgResult.setHidden(false)
        
        if(givenSequence == inputSequence && gameDifficulty == DIFFICULTY.EASY){
            imgResult.setImage(UIImage(named: "correct"))
        }
        else if(givenSequence == inputSequence.reversed() && gameDifficulty == DIFFICULTY.HARD){
            imgResult.setImage(UIImage(named: "correct"))
        }
        else{
            imgResult.setImage(UIImage(named: "incorrect"))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.imgResult.setHidden(true)
            self.pop()
        }
    }
    
    func makeList(_ n: Int) -> [Int] {
        return (0..<n).map {_
            in .random(in: 1...4)
        }
    }
    
    func setPattern(){
        var displayInterval = DispatchTime.now() + 2.0
        displayInterval = gameDifficulty == DIFFICULTY.EASY ? (displayInterval + 3.0) : displayInterval
        givenSequence = makeList(4)
        inputSequence = []

        imgView1.setImage(UIImage(named: String(givenSequence[0])))
        imgView2.setImage(UIImage(named: String(givenSequence[1])))
        imgView3.setImage(UIImage(named: String(givenSequence[2])))
        imgView4.setImage(UIImage(named: String(givenSequence[3])))
        
        DispatchQueue.main.asyncAfter(deadline: displayInterval) {
            self.imgView1.setImage(nil)
            self.imgView2.setImage(nil)
            self.imgView3.setImage(nil)
            self.imgView4.setImage(nil)
        }
    }
}
