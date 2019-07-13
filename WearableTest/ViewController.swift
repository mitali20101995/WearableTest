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
        
        givenSequence = makeList(5)
        
        imgView1.image = UIImage(named: String(givenSequence[0]));
        imgView2.image = UIImage(named: String(givenSequence[1]));
        imgView3.image = UIImage(named: String(givenSequence[2]));
        imgView4.image = UIImage(named: String(givenSequence[3]));
        
    }

    @IBAction func inpBtn1Clicked(_ sender: Any) {
        inputSequence.append(1)
    }
    @IBAction func inpBtn2Clicked(_ sender: Any) {
        inputSequence.append(2)
    }
    @IBAction func inpBtn3Clicked(_ sender: Any) {
        inputSequence.append(3)
    }
    @IBAction func inpBtn4Clicked(_ sender: Any) {
        inputSequence.append(4)
    }
    
    func makeList(_ n: Int) -> [Int] {
        return (0..<n).map {_
            in .random(in: 1...4)
        }
    }
}


