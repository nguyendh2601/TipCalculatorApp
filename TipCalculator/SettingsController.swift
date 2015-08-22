//
//  SettingsController.swift
//  TipCalculator
//
//  Created by Nguyen Duy Hung on 8/20/15.
//  Copyright (c) 2015 Nguyen Duy Hung. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    var tipPercentages = ["0.18", "0.2", "0.25"]
    
    @IBOutlet weak var defaultTipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let defaultTipPercent = defaults.valueForKey("defaultTipAmount") as? String {
            for var index = 0; index < tipPercentages.count; ++index {
                if (defaultTipPercent == tipPercentages[index]) {
                    defaultTipAmount.selectedSegmentIndex = index;
                    break
                }
            }
            println(defaultTipPercent) // Some String Value
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSettingChange(sender: AnyObject) {
        var tipPercent = tipPercentages[defaultTipAmount.selectedSegmentIndex]

        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(tipPercent, forKey: "defaultTipAmount")
        
        defaults.synchronize()
    }
    
    @IBAction func onDismiss(sender: AnyObject) {
        println("Backkkk")
    }
}
