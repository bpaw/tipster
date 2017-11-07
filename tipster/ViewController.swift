//
//  ViewController.swift
//  tipster
//
//  Created by Brandon Paw on 11/4/17.
//  Copyright © 2017 Brandon Paw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
//        let gradient = CAGradientLayer()
//        
//        gradient.frame = view.bounds
//        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
//        
//        view.layer.insertSublayer(gradient, at: 0)
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.float(forKey:"slider1")
        let tip2 = defaults.float(forKey:"slider2")
        let tip3 = defaults.float(forKey:"slider3")
        
        tipControl.setTitle(tip1 > 0 ? String(format: "%.0f%%", tip1): "18%", forSegmentAt: 0)
        tipControl.setTitle(tip2 > 0 ? String(format: "%.0f%%", tip2): "20%", forSegmentAt: 1)
        tipControl.setTitle(tip3 > 0 ? String(format: "%.0f%%", tip3): "25%", forSegmentAt: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.float(forKey:"slider1")
        let tip2 = defaults.float(forKey:"slider2")
        let tip3 = defaults.float(forKey:"slider3")
        
        tipControl.setTitle(tip1 > 0 ? String(format: "%.0f%%", tip1): "18%", forSegmentAt: 0)
        tipControl.setTitle(tip2 > 0 ? String(format: "%.0f%%", tip2): "20%", forSegmentAt: 1)
        tipControl.setTitle(tip3 > 0 ? String(format: "%.0f%%", tip3): "25%", forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calulateTip(_ sender: Any) {
        
        var tipPercentages = [Float(0.18), Float(0.2), Float(0.25)]
        let defaults = UserDefaults.standard
        
        let tip1 = defaults.float(forKey:"slider1")
        let tip2 = defaults.float(forKey:"slider2")
        let tip3 = defaults.float(forKey:"slider3")
        
        if tip1 > 0 {
            tipPercentages[0] = Float(round(100*(tip1 / 100))/100)
        }
        if tip2 > 0 {
            tipPercentages[1] = Float(round(100*(tip2 / 100))/100)
        }
        if tip3 > 0 {
            tipPercentages[2] = Float(round(100*(tip3 / 100))/100)
        }
        
        let bill = Float(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

