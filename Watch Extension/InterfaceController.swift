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
    @IBOutlet var table: WKInterfaceTable!
    
    override init() {
        super.init()
        table.setNumberOfRows(4, withRowType: "MyRow1")
        let row2 = table.rowController(at: 1) as! MyRowController
        let row3 = table.rowController(at: 2) as! MyRowController
        let row4 = table.rowController(at: 3) as! MyRowController
        row2.btn1.setTitle("4")
        row2.btn2.setTitle("5")
        row2.btn3.setTitle("6")
        row3.btn1.setTitle("7")
        row3.btn2.setTitle("8")
        row3.btn3.setTitle("9")
        row4.btn1.setTitle(".")
        row4.btn2.setTitle("0")
        row4.btn3.setTitle("←")
    }
}
