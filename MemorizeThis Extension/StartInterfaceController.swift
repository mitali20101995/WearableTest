//
//  StartInterfaceController.swift
//  MemorizeThis Extension
//
//  Created by Siddharth Trivedi on 2019-07-13.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import WatchKit
import Foundation


class StartInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return segueIdentifier
    }
}
