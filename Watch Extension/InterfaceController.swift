//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Mulang Su on 10/1/16.
//  Copyright © 2016 Mulang Su. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var number = 0

    @IBOutlet var label: WKInterfaceLabel!
    @IBAction func buttonClicked() {
        label.setText("The number is \(number)")
        number += 1
    }

}
