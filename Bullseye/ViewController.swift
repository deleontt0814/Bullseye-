//
//  ViewController.swift
//  Bullseye
//
//  Created by Timothy De leon on 3/10/18.
//  Copyright © 2018 Tim. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel! // Reads directions and random number to hit
    @IBOutlet weak var numSlider: UISlider! // slider
    @IBOutlet weak var resultLabel: UILabel! // result that indicates hit or miss
    @IBOutlet weak var exactSwitch: UISwitch! // turns on exact mode
    @IBOutlet weak var PlayAgain: UIButton!
    
    
    
    var counter = 0
    var randomNumber = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the number to: \(randomNumber)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkValue(_ sender: Any) // when check value button is pressed
    {
        if exactSwitch.isOn == false // switch is off
        {
        
            if Int(numSlider.value) <= randomNumber + 3 && Int(numSlider.value) >= randomNumber - 3
            {
                resultLabel.text = "You were right on point, else Bullseye!"
                resultLabel.textColor  = UIColor.green
            } else {
                resultLabel.text = "Oops you missed, try again"
                resultLabel.textColor = UIColor.red
            } // if number is within +/- 3, indicate hit, if not indicate miss
        
        } else {
            if randomNumber == Int(numSlider.value)
            {
                resultLabel.text = "You were right on point, else Bullseye!"
                resultLabel.textColor  = UIColor.green
            } else {
                resultLabel.text = "Oops you missed, try again"
                resultLabel.textColor = UIColor.red
            }
        } //if number is exact, indicate hit/ miss
        
        resultLabel.isHidden = false //shows result label
        PlayAgain.isHidden = false
    }
    
    
    @IBAction func PlayAgainButton(_ sender: Any) {
        numSlider.setValue(50.0, animated: false) // reset slider to 50
        randomNumber = Int(arc4random_uniform(101)) // reset random number
        numLabel.text = "Move the number to: \(randomNumber)"
        resultLabel.isHidden = true // hide result label
        PlayAgain.isHidden = true // hide play again button
    }
    
    
    
    @IBAction func sliderValueChanger(_ sender: Any)
    {
        
    }
    
    
}

