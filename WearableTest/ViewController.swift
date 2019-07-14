//
//  ViewController.swift
//  WearableTest
//
//  Created by Mitali Ahir on 2019-07-13.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {
    
    var inputSequence : [Int] = []
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (WCSession.isSupported()) {
            print("PHONE: Supports SESSION!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Does NOT support SESSION")
        }
        
//        setPattern()
    }

    @IBAction func inpBtn1Clicked(_ sender: Any) {
        checkInput(input: 1)
    }
    @IBAction func inpBtn2Clicked(_ sender: Any) {
        checkInput(input: 2)
    }
    @IBAction func inpBtn3Clicked(_ sender: Any) {
        checkInput(input: 3)
    }
    @IBAction func inpBtn4Clicked(_ sender: Any) {
        checkInput(input: 4)
    }
    
    func checkInput(input: Int) {
        inputSequence.append(input)
        
        let inputSeqLength = inputSequence.count
        if(inputSeqLength == 4){
            if (WCSession.default.isReachable) {
                print("PHONE: Phone found the watch")
                
                let message = [
                    "data": inputSequence
                ]
                
                WCSession.default.sendMessage(message, replyHandler:nil)
                print("PHONE: Sent the data!")
            }
            else {
                print("PHONE: Cannot find the watch")
            }
            inputSequence = []
            
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
}


