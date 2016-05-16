//
//  ViewController.swift
//  Crack the Code
//
//  Created by Sarju Thakkar on 4/13/16.
//  Copyright © 2016 Sarju Thakkar. All rights reserved.
//
//This script generates a random number from 0 (inclusive) to 1001 (exclusive)
//Then you type your guess for what the random number may be
//Then text displays if you should guess higher or lower until you get it correct
import UIKit

class ViewController: UIViewController {
    var score: Int = 0;
    //initialize score as zero
    var random = Int(arc4random_uniform(1001))
    //generate initial random number and convert it from a UInt32 to Int
    @IBOutlet weak var scoreboard: UILabel!
    //connects UILabel on bottom as scoreboard in script
    @IBOutlet weak var reccomend: UILabel!
    //connects UILabel on top of scoreboard as reccomend in script
    @IBOutlet weak var insert: UITextField!
    //connects UITextField as insert in script
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //This function runs on the click of enter button and takes text from textfield
    @IBAction func enter(sender: AnyObject) {
        insert.resignFirstResponder()
        //keyboard dissapears
        let guess:Int? = Int(insert.text!)
        // guess becomes string in "insert" the text field then it is converted into an int from the string
        // text is forced unwrapped from this optional because there is no way it could crash because the keyboard is set as numerical no decimal
        // be warned it could crash if text is pasted into textfield
        // easy fix with an if statement and just return nil
        if (guess < random) {
            //if the guess is less than the random number then...
            self.reccomend.text = "Guess Higher"
            //Set the reccomend UILabel to Guess Higher
            score = score + 1
            //Update the score value by taking the previous score and adding one
            self.insert.text = ""
            //clears the textfield
            self.scoreboard.text = String(score)
            //Set the scoreboard UILabel to the score which has been converted from an int to a string
        }
        else if (guess > random) {
            //if the guess is greater than the random number then...
            self.reccomend.text = "Guess Lower"
            //Set the reccomend UILabel to Guess Lower
            score = score + 1
            //Update the score value by taking the previous score and adding one
            self.insert.text = ""
            //clears the textfield
            self.scoreboard.text = String(score)
            //Set the scoreboard UILabel to the score which has been converted from an int to a string
        }
        else if (guess == random){
            //if the guess is greater than the random number then...
            self.reccomend.text = "You got it!"
            //Set the reccomend UILabel to You got it
            score = score + 1
            //Update the score value by taking the previous score and adding one
            self.insert.text = ""
            //clears the textfield
            self.scoreboard.text = String(score)
            //Set the scoreboard UILabel to the score which has been converted from an int to a string
            score = 0
            //Set the score to zero for the next round
            random = Int(arc4random_uniform(1001))
            //generate a new random number for next round and onvert it fro UInt32 to Int
        }
    }

}

