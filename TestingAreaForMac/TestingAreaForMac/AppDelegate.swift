//
//  AppDelegate.swift
//  TestingAreaForMac
//
//  Created by Mulang Su on 05/07/2019.
//  Copyright © 2019 Mulang Su. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    @IBAction func item1Pressed(_ sender: Any) {
        print(sender)
    }
}

