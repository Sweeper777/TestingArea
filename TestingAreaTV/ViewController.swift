//
//  ViewController.swift
//  TestingAreaTV
//
//  Created by Mulang Su on 11/12/2016.
//  Copyright © 2016 Mulang Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increment(_ sender: Any) {
        i += 1
        label.text = i.description
    }

}

