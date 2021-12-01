//
//  ViewController.swift
//  Right on target
//
//  Created by Kyzu on 25.11.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
   
    }
    
    //guessed numb
    var number: Int = 0
    
    //round
    var round = 0
    
    // sum of points
    var points = 0
    
    @IBAction func checkNumber() {
        // for first round
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            // get slider's value
            let numSlider = Int(slider.value.rounded())
            //count points
            if (number < numSlider) {
                points += 50 - numSlider + number
            } else if (numSlider < number) {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(title: "Game over", message: "Your result \(points) points", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            //get slider's value
            number = Int.random(in: 1...50)
            label.text = String(number)
            
            
        }
        
        
    }
    
    
    


}

