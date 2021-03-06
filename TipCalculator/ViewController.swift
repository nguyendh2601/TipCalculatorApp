//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nguyen Duy Hung on 8/11/15.
//  Copyright (c) 2015 Nguyen Duy Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let defaultTipPercent = defaults.valueForKey("defaultTipAmount") as? String {
            for var index = 0; index < tipPercentages.count; ++index {
                if ((defaultTipPercent as NSString).doubleValue == tipPercentages[index]) {
                    tipPercentage.selectedSegmentIndex = index;
                    tipPercentage.didChangeValueForKey(defaultTipPercent)
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

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercent = tipPercentages[tipPercentage.selectedSegmentIndex]
        println(tipPercent)
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercent
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

