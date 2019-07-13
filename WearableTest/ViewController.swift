//
//  ViewController.swift
//  WearableTest
//
//  Created by Mitali Ahir on 2019-07-13.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inputSequence : [Int] = []
    var givenSequence : [Int] = []
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setPattern()
    }

    @IBAction func inpBtn1Clicked(_ sender: Any) {
        inputSequence.append(1)
        checkResult()
    }
    @IBAction func inpBtn2Clicked(_ sender: Any) {
        inputSequence.append(2)
        checkResult()
    }
    @IBAction func inpBtn3Clicked(_ sender: Any) {
        inputSequence.append(3)
        checkResult()
    }
    @IBAction func inpBtn4Clicked(_ sender: Any) {
        inputSequence.append(4)
        checkResult()
    }
    
    func checkResult(){
        print("Given: ", givenSequence)
        print("Input: ", inputSequence)
        let inputSeqLength = inputSequence.count
        let givenSeqLength = givenSequence.count
        let recentInputIndex = inputSeqLength - 1
        let recentInput = inputSequence[recentInputIndex]
        let expectedInput = givenSequence[recentInputIndex]
        
        if(recentInput != expectedInput){
            print("Lose")
            setPattern()
        }
        
        else if(inputSeqLength == givenSeqLength){
            print("Won")
            setPattern()
        }
    }
    
    func setPattern(){
        givenSequence = makeList(4)
        inputSequence = []
        imgView1.image = UIImage(named: String(givenSequence[0]));
        imgView2.image = UIImage(named: String(givenSequence[1]));
        imgView3.image = UIImage(named: String(givenSequence[2]));
        imgView4.image = UIImage(named: String(givenSequence[3]));
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.imgView1.image = nil
            self.imgView2.image = nil
            self.imgView3.image = nil
            self.imgView4.image = nil
        }
    }
    
    func makeList(_ n: Int) -> [Int] {
        return (0..<n).map {_
            in .random(in: 1...4)
        }
    }
}


