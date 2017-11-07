//
//  SettingsViewController.swift
//  tipster
//
//  Created by Brandon Paw on 11/6/17.
//  Copyright © 2017 Brandon Paw. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // The Control flow labels
    @IBOutlet weak var controlLabel1: UILabel!
    @IBOutlet weak var controlLabel2: UILabel!
    @IBOutlet weak var controlLabel3: UILabel!
    
    // The Control flow sliders
    @IBOutlet weak var controlSlider1: UISlider!
    @IBOutlet weak var controlSlider2: UISlider!
    @IBOutlet weak var controlSlider3: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard

        let slider1Val = defaults.float(forKey: "slider1") > 0 ? defaults.float(forKey: "slider1") : controlSlider1.value
        let slider2Val = defaults.float(forKey: "slider2") > 0 ? defaults.float(forKey: "slider2") : controlSlider2.value
        let slider3Val = defaults.float(forKey: "slider3") > 0 ? defaults.float(forKey: "slider3") : controlSlider3.value
        
        controlLabel1.text = String(format: "%.0f", slider1Val)
        controlLabel2.text = String(format: "%.0f", slider2Val)
        controlLabel3.text = String(format: "%.0f", slider3Val)
        
        // Do any additional setup after loading the view.
        
        // Store the slider values in the user defaults
        defaults.set(slider1Val, forKey: "slider1")
        defaults.set(slider2Val, forKey: "slider2")
        defaults.set(slider3Val, forKey: "slider3")
    }

    @IBAction func slider1Changed(_ sender: Any) {
        let slider1Val = controlSlider1.value
        
        let defaults = UserDefaults.standard
        defaults.set(slider1Val, forKey: "slider1")
        
        controlLabel1.text = String(format: "%.0f", slider1Val)
    }
    
    @IBAction func slider2Changed(_ sender: Any) {
        let slider2Val = controlSlider2.value
        
        let defaults = UserDefaults.standard
        defaults.set(slider2Val, forKey: "slider2")
        
        controlLabel2.text = String(format: "%.0f", slider2Val)
    }
    
    @IBAction func slider3Changed(_ sender: Any) {
        let slider3Val = controlSlider3.value
        
        let defaults = UserDefaults.standard
        defaults.set(slider3Val, forKey: "slider3")
        
        controlLabel3.text = String(format: "%.0f", slider3Val)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
